const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
const sharp = require('sharp');
const geocoder = require('../helper/geocoder');
const upload = require('../helper/upload-image');
const response = require('../config/res');
const db = require('../config/db');
const verifyToken = require('../helper/verify-token');
const customID = require('../helper/custom-id');

router.use(bodyParser.urlencoded({ limit: "50mb", extended: true, parameterLimit: 50000 }));
router.use(bodyParser.json({ limit: "50mb" }));

const ConvertDMSToDD = (degrees, minutes, seconds, direction) => {
    let dd = degrees + (minutes/60) + (seconds/3600);
        
      if (direction == "S" || direction == "W") {
          dd = dd * -1; 
      }
        
    return dd;
  }

router.get('/', verifyToken, async (req, res) => {
  try {
    let query = `SELECT lapor.id_lapor, lapor.kode_lapor, lapor.id_user_lapor, lapor.kat_lapor, lapor.foto_lapor,
                 lapor.desk_lapor, lapor.lat_lapor, lapor.long_lapor, lapor.lokasi_lapor, lapor.vote_lapor,
                 lapor.tgl_lapor, lapor.status_lapor, user.nama_user, user.foto_user, 
                 (SELECT COUNT(komentar.id_komentar) FROM komentar WHERE komentar.id_lapor_komentar = lapor.id_lapor)
                 AS total_komentar FROM lapor INNER JOIN user ON lapor.id_user_lapor = user.id_user ORDER BY id_lapor DESC `;
      let result = await db.query(query);
      response.ok(result, res);
  } catch (error) {
      console.log(error.message);
  }
});

router.get('/laporku', verifyToken, async (req, res) => {
  try {
      let result = await db.query('SELECT * FROM lapor INNER JOIN user ON lapor.id_user_lapor = user.id_user AND user.id_user = ? ORDER BY id_lapor DESC', 
      [req.user.userId]);
      response.ok(result, res);
  } catch (error) {
      console.log(error.message);
  }
});

router.post('/lokasi', verifyToken, (req, res) => {
  let arr = [];
  if(req.body.GPSLatitude){
    // Calculate latitude decimal
    let latDegree = req.body.GPSLatitude[0];
    let latMinute = req.body.GPSLatitude[1];
    let latSecond = req.body.GPSLatitude[2];
    let latDirection = req.body.GPSLatitudeRef;
          
    let latFinal = ConvertDMSToDD(latDegree, latMinute, latSecond, latDirection);

    // Calculate longitude decimal
    let lonDegree = req.body.GPSLongitude[0];
    let lonMinute = req.body.GPSLongitude[1];
    let lonSecond = req.body.GPSLongitude[2];
    let lonDirection = req.body.GPSLongitudeRef;

    let lonFinal = ConvertDMSToDD(lonDegree, lonMinute, lonSecond, lonDirection);

    geocoder.reverse({lat: latFinal, lon: lonFinal}, function(err, data) {
      if (err) {
        response.fail(err, res);
      } else {
          arr.push({
            originLat: latFinal,
            originLng: lonFinal,
            data: data[data.length - 1]
                });

          console.log(arr);

          response.ok(arr, res)
      }
  })} else {
        response.fail("tidak ada exif data", res);
    }
});

router.post('/', verifyToken, upload.single('fotoLapor'), async (req, res) => {
  try {
    let fullUrl = req.protocol + '://' + req.get('host') + '/';
    let path = req.file.path.replace(/\\/g, "/");

    let resize = await sharp('./' + path).withMetadata().toBuffer();
    await sharp(resize).withMetadata().resize(1080).toFile('./' + path);
    
    let uniqueID = await customID('lapor', 'kode_lapor', 'LPR-', 4);

    let kode = uniqueID;
    let userid = req.user.userId;
    let kat = req.body.kat;
    let fotoLapor = fullUrl + path;
    let desk = req.body.desk;
    let lat = req.body.lat;
    let long = req.body.long;
    let lokasi = req.body.lokasi;
    let vote = req.body.vote;
    let tgl = new Date();
    let status = "Menunggu";
    
    await db.query('INSERT INTO lapor (kode_lapor, id_user_lapor, kat_lapor, foto_lapor, desk_lapor, lat_lapor, long_lapor, lokasi_lapor, vote_lapor, tgl_lapor, status_lapor) values (?,?,?,?,?,?,?,?,?,?,?)',
            [ kode, userid, kat, fotoLapor, desk, lat, long, lokasi, vote, tgl, status  ]);

            response.ok("Berhasil menambahkan lapor!", res);
  } catch (error) {
    res.status(500).json({message: error.message});
  }
});

router.get('/:id', verifyToken, async (req, res) => {
  try {
    let query = `SELECT lapor.id_lapor, lapor.id_user_lapor, lapor.kode_lapor, user.nama_user, user.foto_user, lapor.kat_lapor, lapor.foto_lapor, lapor.desk_lapor, lapor.lat_lapor, lapor.long_lapor, lapor.lokasi_lapor, lapor.vote_lapor, lapor.tgl_lapor, lapor.status_lapor,
              (SELECT komentar.id_komentar FROM user LEFT JOIN komentar ON komentar.id_user_komentar = user.id_user INNER JOIN lapor ON komentar.id_lapor_komentar = lapor.id_lapor AND lapor.id_lapor = ? ORDER BY komentar.id_komentar DESC LIMIT 1 ) AS id_komentar,
              (SELECT user.id_user FROM user LEFT JOIN komentar ON komentar.id_user_komentar = user.id_user INNER JOIN lapor ON komentar.id_lapor_komentar = lapor.id_lapor AND lapor.id_lapor = ? ORDER BY komentar.id_komentar DESC LIMIT 1 ) AS id_komentator,
              (SELECT user.nama_user FROM user LEFT JOIN komentar ON komentar.id_user_komentar = user.id_user INNER JOIN lapor ON komentar.id_lapor_komentar = lapor.id_lapor AND lapor.id_lapor = ? ORDER BY komentar.id_komentar DESC LIMIT 1 ) AS nama_komentator,
              (SELECT user.foto_user FROM user LEFT JOIN komentar ON komentar.id_user_komentar = user.id_user INNER JOIN lapor ON komentar.id_lapor_komentar = lapor.id_lapor AND lapor.id_lapor = ? ORDER BY komentar.id_komentar DESC LIMIT 1 ) AS foto_komentator,
              (SELECT komentar.desk_komentar FROM user LEFT JOIN komentar ON komentar.id_user_komentar = user.id_user INNER JOIN lapor ON komentar.id_lapor_komentar = lapor.id_lapor AND lapor.id_lapor = ? ORDER BY komentar.id_komentar DESC LIMIT 1 ) AS desk_komentar,
              (SELECT komentar.tgl_komentar FROM user LEFT JOIN komentar ON komentar.id_user_komentar = user.id_user INNER JOIN lapor ON komentar.id_lapor_komentar = lapor.id_lapor AND lapor.id_lapor = ? ORDER BY komentar.id_komentar DESC LIMIT 1 ) AS tgl_komentar,
              (SELECT COUNT(komentar.id_komentar) FROM komentar WHERE komentar.id_lapor_komentar = ?) AS total_komentar
              FROM lapor INNER JOIN user ON lapor.id_user_lapor = user.id_user AND lapor.id_lapor = ?`
      let result = await db.query(query,
      [req.params.id, req.params.id, req.params.id, req.params.id, req.params.id, req.params.id, req.params.id, req.params.id]);
      response.ok(result, res);
  } catch (error) {
      console.log(error.message);
  }
});

module.exports = router;