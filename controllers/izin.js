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

router.get('/getall', verifyToken, async (req, res) => {
    try {
        let query = `SELECT 
                        *, 
                        (SELECT COUNT(izin.status_izin) FROM izin WHERE izin.status_izin = 'Menunggu') 
                        AS total_menunggu, (SELECT COUNT(izin.status_izin) FROM izin WHERE izin.status_izin = 'Proses') 
                        AS total_proses, (SELECT COUNT(izin.status_izin) FROM izin WHERE izin.status_izin = 'Selesai') 
                        AS total_selesai, (SELECT COUNT(izin.status_izin) FROM izin WHERE izin.status_izin = 'Ditolak') 
                        AS total_ditolak 
                     FROM 
                        izin 
                    INNER JOIN 
                        user 
                    ON 
                        izin.id_user_izin = user.id_user
                     ORDER BY id_izin DESC`;
        let result = await db.query(query);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
        res.status(500).json({message: error.message});
    }
});

router.get('/getall/:id', verifyToken, async (req, res) => {
    try {
        let query = `SELECT * FROM izin INNER JOIN user ON izin.id_user_izin = user.id_user
                     AND izin.id_izin = ? ORDER BY id_izin DESC`;
        let result = await db.query(query, [req.params.id]);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
        res.status(500).json({message: error.message});
    }
});

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
router.get('/:id', verifyToken, async (req, res) => {
    try {
        let query = `SELECT * FROM izin WHERE id_izin = ?`;
        let result = await db.query(query, [req.params.id]);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
        res.status(500).json({message: error.message});
    }
});

router.post('/', verifyToken, upload.fields([{name: 'fotoSurat'}, {name: 'fotoKTP'}, {name: 'fotoKK'}]), async (req, res) => {
    try {
        let pathSurat = req.files.fotoSurat[0].path.replace(/\\/g, "/");
        let pathKTP = req.files.fotoKTP[0].path.replace(/\\/g, "/");
        let pathKK = req.files.fotoKK[0].path.replace(/\\/g, "/");

        let resizeSurat = await sharp('./' + pathSurat).withMetadata().toBuffer();
        await sharp(resizeSurat).withMetadata().resize(1080).toFile('./' + pathSurat);

        let resizeKTP = await sharp('./' + pathKTP).withMetadata().toBuffer();
        await sharp(resizeKTP).withMetadata().resize(1080).toFile('./' + pathKTP);

        let resizeKK = await sharp('./' + pathKK).withMetadata().toBuffer();
        await sharp(resizeKK).withMetadata().resize(1080).toFile('./' + pathKK);
        
        let kode = await customID('izin', 'kode_izin', 'IZN-', 4);

        let iduser = req.user.userId;
        let surat = '/' + pathSurat;
        let ktp = '/' + pathKTP;
        let kk = '/' + pathKK;
        let desk = req.body.desk;
        let loc = req.body.loc;
        let tglmulai = req.body.tglmulai;
        let tglend = req.body.tglend;
        let jammulai = req.body.jammulai;
        let jamend = req.body.jamend;
        let tgl = new Date();
        let status = 'Menunggu';

        let result = await db.query('INSERT INTO izin (id_user_izin, kode_izin, surat_izin, ktp_izin, kk_izin, kegiatan_izin, lokasi_izin, tgl_mulai_izin, tgl_selesai_izin, jam_mulai_izin, jam_selesai_izin, tgl_izin, status_izin) values (?,?,?,?,?,?,?,?,?,?,?,?,?)',
        [ iduser, kode, surat, ktp, kk, desk, loc, tglmulai, tglend, jammulai, jamend, tgl, status ]);
            
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
        res.status(500).json({message: error.message});
    }
});

router.put('/:id', verifyToken, async (req, res) => {
    try {
        let query = await db.query('UPDATE izin SET status_izin = ?, pesan_tolak_izin = ? WHERE id_izin = ?', 
        [req.body.status, req.body.pesan, req.params.id]);
        response.ok(query, res);
    } catch (error) {
        console.log(error.message);
        res.status(500).json({message: error.message});
        
    }
})

module.exports = router;