const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
const upload = require('../helper/upload-image');
const response = require('../config/res');
const db = require('../config/db');
const verifyToken = require('../helper/verify-token');

router.use(bodyParser.urlencoded({ extended: true }));
router.use(bodyParser.json());

router.get('/', async (req, res) => {
    try {
        let result = await db.query('SELECT * FROM info');
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
    }
});

router.get('/:kat', async (req, res) => {
    try {
        let kat = req.body.kat;

        let result = await db.query('SELECT * FROM info WHERE kat_info = ?', [kat]);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
    }
});

router.post('/', upload.single('fotoInfo'), async (req, res) => {
    try {
        let fullUrl = req.protocol + '://' + req.get('host') + '/';
        let path = req.file.path.replace(/\\/g, "/");
        
        let judul = req.body.judul;
        let fotoInfo = fullUrl + path;
        let desk = req.body.desk;
        let kat = req.body.kat;
        let tgl = req.body.tgl;
        let author = req.body.author;

        let result = await db.query('INSERT INTO info (judul_info, foto_info, desk_info, kat_info, tgl_info, author_info) values (?,?,?,?,?,?)', 
        [judul, fotoInfo, desk, kat, tgl, author]);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
    }
});

router.put('/', async (req, res) => {
    try {
        let id = req.body.id;
        let judul = req.body.judul;
        let foto = req.body.foto;
        let desk = req.body.desk;
        let kat = req.body.kat;
        let tgl = req.body.tgl;
        let author = req.body.author;

        let result = await db.query('UPDATE info SET judul_info = ?, foto_info = ?, desk_info = ?, kat_info = ?, tgl_info = ?, author_info = ? WHERE id_info = ?', 
        [judul, foto, desk, kat, tgl, author, id]);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
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