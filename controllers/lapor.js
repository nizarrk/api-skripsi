const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
var NodeGeocoder = require('node-geocoder');
 
var options = {
  provider: 'here',
 
  // Optional depending on the providers
  appId: 'cX5rfU6D1cSiACyKEWDz',
  appCode: 'GVFwmLCfnJA4BIo2tKkolg',
  httpAdapter: 'https', // Default
  formatter: 'json'         // 'gpx', 'string', ...
};
 
var geocoder = NodeGeocoder(options);
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

router.post('/lokasi', (req, res) => {
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

router.post('/', upload.single('fotoLapor'), async (req, res) => {
  try {
    let fullUrl = req.protocol + '://' + req.get('host') + '/';
    let path = req.file.path.replace(/\\/g, "/");

    let uniqueID = await customID('lapor', 'kode_lapor', 'LAPOR-', 4);

    let kode = uniqueID;
    let userid = req.body.userid;
    let kat = req.body.kat;
    let fotoLapor = fullUrl + path;
    let desk = req.body.desk;
    let lat = req.body.lat;
    let long = req.body.long;
    let lokasi = req.body.lokasi;
    let vote = req.body.vote;
    let tgl = new Date();

    await db.query('INSERT INTO lapor (kode_lapor, id_user_lapor, kat_lapor, foto_lapor, desk_lapor, lat_lapor, long_lapor, lokasi_lapor, vote_lapor, tgl_lapor) values (?,?,?,?,?,?,?,?,?,?)',
            [ kode, userid, kat, fotoLapor, desk, lat, long, lokasi, vote, tgl  ]);

            response.ok("Berhasil menambahkan lapor!", res);
  } catch (error) {
    res.status(500).json({message: error.message});
  }
});

router.get('/', async (req, res) => {
  try {
      let result = await db.query('SELECT * FROM lapor');
      response.ok(result, res);
  } catch (error) {
      console.log(error.message);
  }
});

module.exports = router;