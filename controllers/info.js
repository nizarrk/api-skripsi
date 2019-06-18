const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
const sharp = require('sharp');
const upload = require('../helper/upload-image');
const response = require('../config/res');
const db = require('../config/db');
const verifyToken = require('../helper/verify-token');

router.use(bodyParser.urlencoded({ limit: "50mb", extended: true, parameterLimit: 50000 }));
router.use(bodyParser.json({ limit: "50mb" }));

router.get('/trayek', async (req, res) => {
    try {
        let result = await db.query('SELECT * FROM trayek ORDER BY id_trayek DESC');
        response.ok(result, res);        
    } catch (error) {
        console.log(error.message);
        
    }
});

router.get('/', async (req, res) => {
    try {
        let result = await db.query('SELECT * FROM info ORDER BY id_info DESC');
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
    }
});

router.get('/:id', async (req, res) => {
    try {
        let result = await db.query('SELECT * FROM info WHERE id_info = ?', 
        [req.params.id]);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
    }
});

router.get('/trayek/:id', async (req, res) => {
    try {
        let query = `SELECT * FROM trayek WHERE id_trayek = ?`;
        let id = req.params.id;
        let result =await db.query(query, [id]);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
        
    }
});

router.post('/trayek', async (req, res) => {
    try {
        let nama = req.body.nama;
        let rute = req.body.rute;
        let latlng = JSON.stringify(req.body.latlng);
        let jarak = req.body.jarak;
        let status = 'Aktif';
        
        
        
        let result = await db.query('INSERT INTO trayek (nama_trayek, rute_trayek, latlng_trayek, jarak_trayek, status_trayek) VALUES (?,?,?,?,?)',
        [nama, rute, latlng, jarak, status]);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
        
    }
});

router.put('/trayek', async (req, res) => {
    try {
        console.log(req.body);
        let id = req.body.id;
        let nama = req.body.nama;
        let rute = req.body.rute;
        let latlng = JSON.stringify(req.body.latlng);
        let jarak = req.body.jarak;
        let status = 'Aktif';
        
        
        
        let result = await db.query('UPDATE trayek SET nama_trayek = ?, rute_trayek = ?, latlng_trayek = ?, jarak_trayek = ?, status_trayek = ? WHERE id_trayek = ?',
        [nama, rute, latlng, jarak, status, id]);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
        
    }
});

router.delete('/trayek/:id', async (req, res) => {
    try {
        let id = req.params.id;

        let result = await db.query('DELETE FROM trayek WHERE id_trayek = ?', [id]);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
    }
});

router.post('/', upload.single('fotoInfo'), async (req, res) => {
    try {
        let path = req.file.path.replace(/\\/g, "/");

        let resize = await sharp('./' + path).withMetadata().toBuffer();
        await sharp(resize).withMetadata().resize(1080).toFile('./' + path);
        
        let judul = req.body.judul;
        let fotoInfo = '/' + path;
        let desk = req.body.desk;
        let kat = req.body.kat;
        let tgl = new Date();
        let author = req.body.author;

        let result = await db.query('INSERT INTO info (judul_info, foto_info, desk_info, kat_info, tgl_info, author_info) VALUES (?,?,?,?,?,?)', 
        [judul, fotoInfo, desk, kat, tgl, author]);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
    }
});

router.put('/', upload.single('fotoInfo'), async (req, res) => {
    try {
        let id = req.body.id;
        let judul = req.body.judul;
        let desk = req.body.desk;
        let kat = req.body.kat;
        let author = req.body.author;
        if (req.file == undefined) {
            let result = await db.query('UPDATE info SET judul_info = ?, desk_info = ?, kat_info = ?, author_info = ? WHERE id_info = ?', 
            [judul, desk, kat, author, id]);
            response.ok(result, res);
        } else {
            let path = req.file.path.replace(/\\/g, "/");

            let resize = await sharp('./' + path).withMetadata().toBuffer();
            await sharp(resize).withMetadata().resize(1080).toFile('./' + path);

            let id = req.body.id;
            let judul = req.body.judul;
            let fotoInfo = '/' + path;
            let desk = req.body.desk;
            let kat = req.body.kat;
            let author = req.body.author;
            
            let result = await db.query('UPDATE info SET judul_info = ?, foto_info = ?, desk_info = ?, kat_info = ?, author_info = ? WHERE id_info = ?', 
            [judul, fotoInfo, desk, kat, tgl, author, id]);
            response.ok(result, res);
        }
    } catch (error) {
        console.log(error.message);
        res.status(500).json({message: error.message});
    }
});

router.delete('/:id', async (req, res) => {
    try {
        let id = req.params.id;

        let result = await db.query('DELETE FROM info WHERE id_info = ?', [id]);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
    }
});

module.exports = router;