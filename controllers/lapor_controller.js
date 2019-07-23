const sharp = require('sharp');
const piexif = require("piexifjs");
const fs = require("fs");
const geocoder = require('../helper/geocoder');
const response = require('../config/res');
const db = require('../config/db');
const customID = require('../helper/custom-id');

class LaporController {
  constructor() {
    this.kode = null;
    this.userid = null;
    this.kat = null;
    this.fotoLapor = null;
    this.desk = null;
    this.lat = null;
    this.long = null;
    this.lokasi = null;
    this.district = null;
    this.tgl = null;
    this.status = null;
  }

  ConvertDMSToDD(degrees, minutes, seconds, direction) {
    let dd = degrees + (minutes/60) + (seconds/3600);
        
      if (direction == "S" || direction == "W") {
          dd = dd * -1; 
      }
        
    return dd;
  }
  
  async cariLaporan(req, res) {
    try {
      let cari = '%' +   req.params.cari + '%';
      console.log(cari);
      
      let query = `SELECT *, (SELECT COUNT(komentar.id_komentar) FROM komentar WHERE
                   komentar.id_lapor_komentar = lapor.id_lapor) AS total_komentar, 
                   (SELECT COUNT(vote.id_vote) FROM vote WHERE vote.id_lapor_vote = lapor.id_lapor) 
                   AS total_vote FROM lapor INNER JOIN user ON lapor.id_user_lapor = user.id_user 
                   WHERE lapor.lokasi_lapor LIKE ? OR lapor.lokasi_kec_lapor LIKE ?
                   ORDER BY id_lapor DESC`;
  
      let result = await db.query (query, [cari, cari]);
      response.ok(result, res);
    } catch (error) {
      console.log(error.message);
      
    }
  }
  
  async lihatLaporan(req, res) {
    try {
      let query = `SELECT *, (SELECT COUNT(komentar.id_komentar) FROM komentar WHERE
                   komentar.id_lapor_komentar = lapor.id_lapor) AS total_komentar, 
                   (SELECT COUNT(vote.id_vote) FROM vote WHERE vote.id_lapor_vote = lapor.id_lapor) 
                   AS total_vote, (SELECT COUNT(lapor.status_lapor) FROM lapor WHERE lapor.status_lapor = 'Menunggu') 
                   AS total_menunggu, (SELECT COUNT(lapor.status_lapor) FROM lapor WHERE lapor.status_lapor = 'Proses') 
                   AS total_proses, (SELECT COUNT(lapor.status_lapor) FROM lapor WHERE lapor.status_lapor = 'Selesai') 
                   AS total_selesai, (SELECT COUNT(lapor.status_lapor) FROM lapor WHERE lapor.status_lapor = 'Ditolak') 
                   AS total_ditolak FROM lapor INNER JOIN user ON lapor.id_user_lapor = user.id_user 
                   ORDER BY id_lapor DESC`;
  
      let result = await db.query (query);
      response.ok(result, res);
    } catch (error) {
      console.log(error.message);
      
    }
  }
  
  async getLaporanById(req, res) {
    try {
      let query = `SELECT id_lapor, kode_lapor, id_user_lapor FROM lapor WHERE id_lapor = ?`;
  
      let result = await db.query (query, [req.params.id]);
      response.ok(result, res);
    } catch (error) {
      console.log(error.message);
      
    }
  }
  
  async updateStatusLaporan(req, res) {
    try {
        let query = await db.query('UPDATE lapor SET status_lapor = ?, pesan_tolak_lapor = ? WHERE id_lapor = ?', 
        [req.body.status, req.body.pesan, req.params.id]);
        response.ok(query, res);
    } catch (error) {
        console.log(error.message);
        res.status(500).json({message: error.message});
        
    }
  }
  
  async getVoteLaporan(req, res) {
    try {
      let query = `SELECT vote.id_vote, vote.id_lapor_vote, vote.id_user_vote, lapor.id_lapor,
                    lapor.id_user_lapor FROM vote, lapor WHERE vote.id_lapor_vote = lapor.id_lapor AND vote.id_lapor_vote = ?`;
      let result = await db.query(query, [req.params.id]);
      response.ok(result, res);
    } catch (error) {
        console.log(error.message);
    }
  }
  
  async voteLaporan(req, res) {
    try {
      let query = `INSERT INTO vote (id_lapor_vote, id_user_vote, tgl_vote) values (?,?,?)`;
      let result = await db.query(query, [req.body.idlapor, req.user.userId, new Date()]);
      response.ok(result, res);
    } catch (error) {
        console.log(error.message);
    }
  }
  
  async deleteVoteLaporan(req, res) {
    try {
        let id = req.params.id;
  
        let result = await db.query('DELETE FROM vote WHERE id_vote = ?', [id]);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
    }
  }
  
  async getlaporanBeranda(req, res) {
    try {
      let query = `SELECT 
                      lapor.id_lapor, lapor.kode_lapor, lapor.id_user_lapor, lapor.kat_lapor, lapor.foto_lapor,
                      lapor.desk_lapor, lapor.lat_lapor, lapor.long_lapor, lapor.lokasi_lapor, 
                      lapor.tgl_lapor, lapor.status_lapor, user.nama_user, user.foto_user, 
                      (SELECT COUNT(komentar.id_komentar) FROM komentar WHERE komentar.id_lapor_komentar = lapor.id_lapor)
                      AS total_komentar, (SELECT COUNT(vote.id_vote) FROM vote WHERE vote.id_lapor_vote = lapor.id_lapor)
                      AS total_vote, (SELECT COUNT(vote.id_vote) FROM vote WHERE vote.id_lapor_vote = lapor.id_lapor  AND vote.id_user_vote = ?)
                      AS pernah_vote, vote.id_vote 
                  FROM 
                      lapor 
                  INNER JOIN 
                      user 
                  ON 
                      lapor.id_user_lapor = user.id_user 
                  LEFT JOIN 
                      vote 
                  ON 
                      vote.id_lapor_vote = lapor.id_lapor AND vote.id_user_vote = ? 
                  WHERE NOT 
                      lapor.status_lapor = 'Ditolak'
                  ORDER BY 
                      id_lapor DESC`;
      let result = await db.query(query, [req.user.userId, req.user.userId]);
      response.ok(result, res);
    } catch (error) {
        console.log(error.message);
    }
  }
  
  async getLaporanByUser(req, res) {
    try {
      let query = `SELECT * FROM lapor INNER JOIN user ON 
                  lapor.id_user_lapor = user.id_user AND user.id_user = ? ORDER BY id_lapor DESC`;
        let result = await db.query(query, [req.user.userId]);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
    }
  }
  
  async getLaporanDetail(req, res) {
    try {
      let query = `SELECT lapor.id_lapor, lapor.id_user_lapor, lapor.kode_lapor, user.nama_user, user.foto_user, lapor.kat_lapor, lapor.foto_lapor, lapor.desk_lapor, lapor.lat_lapor, lapor.long_lapor, lapor.lokasi_lapor,  lapor.tgl_lapor, lapor.status_lapor, lapor.pesan_tolak_lapor,
                (SELECT komentar.id_komentar FROM user LEFT JOIN komentar ON komentar.id_user_komentar = user.id_user INNER JOIN lapor ON komentar.id_lapor_komentar = lapor.id_lapor AND lapor.id_lapor = ? ORDER BY komentar.id_komentar DESC LIMIT 1 ) AS id_komentar,
                (SELECT user.id_user FROM user LEFT JOIN komentar ON komentar.id_user_komentar = user.id_user INNER JOIN lapor ON komentar.id_lapor_komentar = lapor.id_lapor AND lapor.id_lapor = ? ORDER BY komentar.id_komentar DESC LIMIT 1 ) AS id_komentator,
                (SELECT user.nama_user FROM user LEFT JOIN komentar ON komentar.id_user_komentar = user.id_user INNER JOIN lapor ON komentar.id_lapor_komentar = lapor.id_lapor AND lapor.id_lapor = ? ORDER BY komentar.id_komentar DESC LIMIT 1 ) AS nama_komentator,
                (SELECT user.foto_user FROM user LEFT JOIN komentar ON komentar.id_user_komentar = user.id_user INNER JOIN lapor ON komentar.id_lapor_komentar = lapor.id_lapor AND lapor.id_lapor = ? ORDER BY komentar.id_komentar DESC LIMIT 1 ) AS foto_komentator,
                (SELECT komentar.desk_komentar FROM user LEFT JOIN komentar ON komentar.id_user_komentar = user.id_user INNER JOIN lapor ON komentar.id_lapor_komentar = lapor.id_lapor AND lapor.id_lapor = ? ORDER BY komentar.id_komentar DESC LIMIT 1 ) AS desk_komentar,
                (SELECT komentar.tgl_komentar FROM user LEFT JOIN komentar ON komentar.id_user_komentar = user.id_user INNER JOIN lapor ON komentar.id_lapor_komentar = lapor.id_lapor AND lapor.id_lapor = ? ORDER BY komentar.id_komentar DESC LIMIT 1 ) AS tgl_komentar,
                (SELECT COUNT(komentar.id_komentar) FROM komentar WHERE komentar.id_lapor_komentar = ?) AS total_komentar,
                (SELECT COUNT(vote.id_vote) FROM vote WHERE vote.id_lapor_vote = lapor.id_lapor)
                AS total_vote, (SELECT COUNT(vote.id_vote) FROM vote WHERE vote.id_lapor_vote = lapor.id_lapor  AND vote.id_user_vote = ?)
                AS pernah_vote, vote.id_vote FROM lapor INNER JOIN user ON lapor.id_user_lapor = user.id_user AND lapor.id_lapor = ? LEFT JOIN vote ON vote.id_lapor_vote = lapor.id_lapor AND vote.id_user_vote = ?`
        let result = await db.query(query,
        [req.params.id, req.params.id, req.params.id, req.params.id, req.params.id, req.params.id, req.params.id, req.user.userId, req.params.id, req.user.userId]);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
        res.status(500).json({message: error.message});
    }
  }
  
  async geocode(req, res) {
    try {
      let arr = [];
      if(req.body.GPSLatitude){
        // Calculate latitude decimal
        let latDegree = req.body.GPSLatitude[0];
        let latMinute = req.body.GPSLatitude[1];
        let latSecond = req.body.GPSLatitude[2];
        let latDirection = req.body.GPSLatitudeRef;
              
        let latFinal = this.ConvertDMSToDD(latDegree, latMinute, latSecond, latDirection);
  
        // Calculate longitude decimal
        let lonDegree = req.body.GPSLongitude[0];
        let lonMinute = req.body.GPSLongitude[1];
        let lonSecond = req.body.GPSLongitude[2];
        let lonDirection = req.body.GPSLongitudeRef;
  
        let lonFinal = this.ConvertDMSToDD(lonDegree, lonMinute, lonSecond, lonDirection);
  
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
        })
      } else if (req.body.lat) {
        let lat = req.body.lat;
        let lng = req.body.lng;
  
        geocoder.reverse({lat: lat, lon: lng}, function(err, data) {
          if (err) {
            response.fail(err, res);
          } else {
              arr.push({
                originLat: lat,
                originLng: lng,
                data: data[data.length - 1]
                    });
                    console.log(arr);
              response.ok(arr, res)
          }
        });
      } else {
        //response.fail("tidak ada exif data", res);
        res.status(204).json({message: 'tidak ada exif data'});
        }
      
    } catch (error) {
      res.status(500).json({message: error.message});
      
    }
  }
  
  async tambahLaporan(req, res) {
    try {    
      if (req.body.status == 'true') {
        let file = fs.readFileSync(req.file.path);
        let data = file.toString("binary");
        let gps = {};
        let lat = req.body.lat;
        let lng = req.body.lng;
        
        gps[piexif.GPSIFD.GPSLatitudeRef] = lat < 0 ? 'S' : 'N';
        gps[piexif.GPSIFD.GPSLatitude] = piexif.GPSHelper.degToDmsRational(lat);
        gps[piexif.GPSIFD.GPSLongitudeRef] = lng < 0 ? 'W' : 'E';
        gps[piexif.GPSIFD.GPSLongitude] = piexif.GPSHelper.degToDmsRational(lng);
  
        let exifObj = {"GPS":gps};
        let exifbytes = piexif.dump(exifObj);
  
        let newData = piexif.insert(exifbytes, data);
        let newfile = new Buffer.from(newData, "binary");
        
        fs.writeFileSync(req.file.path, newfile);
        
      }
      
      let path = req.file.path.replace(/\\/g, "/");
  
      let resize = await sharp('./' + path).withMetadata().toBuffer();
      await sharp(resize).withMetadata().resize(1080).toFile('./' + path);
      
      let kode = await customID('lapor', 'kode_lapor', 'LPR-', 4);
  
      let userid = req.user.userId;
      let kat = req.body.kat;
      let fotoLapor = '/' + path;
      let desk = req.body.desk;
      let lat = req.body.lat;
      let long = req.body.lng;
      let lokasi = req.body.lokasi;
      let district = req.body.district;
      let tgl = new Date();
      let status = "Menunggu";
      
      let result = await db.query('INSERT INTO lapor (kode_lapor, id_user_lapor, kat_lapor, foto_lapor, desk_lapor, lat_lapor, long_lapor, lokasi_lapor, lokasi_kec_lapor, tgl_lapor, status_lapor) values (?,?,?,?,?,?,?,?,?,?,?)',
              [ kode, userid, kat, fotoLapor, desk, lat, long, lokasi, district, tgl, status  ]);
  
              response.ok(result, res);
    } catch (error) {
      console.log(error.response);
      res.status(500).json({message: error.message});
    }
  }
  
  async piexif(req, res) {
    try {
      let file = fs.readFileSync(req.file.path);
      let data = file.toString("binary");
      let gps = {};
      let lat = req.body.lat;
      let lng = req.body.lng;
  
      gps[piexif.GPSIFD.GPSLatitudeRef] = lat < 0 ? 'S' : 'N';
      gps[piexif.GPSIFD.GPSLatitude] = piexif.GPSHelper.degToDmsRational(lat);
      gps[piexif.GPSIFD.GPSLongitudeRef] = lng < 0 ? 'W' : 'E';
      gps[piexif.GPSIFD.GPSLongitude] = piexif.GPSHelper.degToDmsRational(lng);
  
      let exifObj = {"GPS":gps};
      let exifbytes = piexif.dump(exifObj);
  
      let newData = piexif.insert(exifbytes, data);
      let newfile = new Buffer.from(newData, "binary");
      
      fs.writeFileSync(req.file.path, newfile);
      
    } catch (error) {
      res.status(500).json({message: error.message});
    }
  }
  
  async editLaporan(req, res) {
    try {
      let id = req.params.id;
      let desk = req.body.desk;
      let query = `UPDATE lapor SET lapor.desk_lapor = ? WHERE lapor.id_lapor = ?`;
      let result = await db.query(query, [desk, id]);
      response.ok(result, res);
    } catch (error) {
      console.log(error.message);
      res.status(500).json({message: error.message});
    }
  }
}

module.exports = LaporController;