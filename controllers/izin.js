const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
const sharp = require('sharp');
const upload = require('../helper/upload-image');
const response = require('../config/res');
const db = require('../config/db');
const verifyToken = require('../helper/verify-token');
const customID = require('../helper/custom-id');

router.use(bodyParser.urlencoded({ limit: "50mb", extended: true, parameterLimit: 50000 }));
router.use(bodyParser.json({ limit: "50mb" }));

router.get('/', verifyToken, async (req, res) => {
    try {
        let query = `SELECT * FROM izin INNER JOIN user ON izin.id_user_izin = user.id_user 
                    AND user.id_user = ? ORDER BY id_izin DESC`;
        let result = await db.query(query, [req.user.userId]);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
        res.status(500).json({message: error.message});
    }
});

router.post('/', verifyToken, upload.fields([{name: 'fotoSurat'}, {name: 'fotoKTP'}]), async (req, res) => {
    try {        
        let fullUrl = req.protocol + '://' + req.get('host') + '/';
        let pathSurat = req.files.fotoSurat[0].path.replace(/\\/g, "/");
        let pathKTP = req.files.fotoKTP[0].path.replace(/\\/g, "/");

        let resizeSurat = await sharp('./' + pathSurat).withMetadata().toBuffer();
        await sharp(resizeSurat).withMetadata().resize(1080).toFile('./' + pathSurat);

        let resizeKTP = await sharp('./' + pathKTP).withMetadata().toBuffer();
        await sharp(resizeKTP).withMetadata().resize(1080).toFile('./' + pathKTP);
        
        let kode = await customID('izin', 'kode_izin', 'IZN-', 4);

        let iduser = req.user.userId;
        let surat = '/' + pathSurat;
        let ktp = '/' + pathKTP;
        let desk = req.body.desk;
        let tgl = new Date();
        let status = 'Menunggu';

        await db.query('INSERT INTO izin (id_user_izin, kode_izin, surat_izin, ktp_izin, desk_izin, tgl_izin, status_izin) values (?,?,?,?,?,?,?)',
        [ iduser, kode, surat, ktp, desk, tgl, status ]);
            
        response.ok("Berhasil menambahkan izin!", res);
    } catch (error) {
        console.log(error.message);
        res.status(500).json({message: error.message});
    }
});

module.exports = router;