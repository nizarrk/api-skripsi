const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
const response = require('../config/res');
const db = require('../config/db');
const verifyToken = require('../helper/verify-token');

router.use(bodyParser.urlencoded({ limit: "50mb", extended: true, parameterLimit: 50000 }));
router.use(bodyParser.json({ limit: "50mb" }));

router.get('/:id', async (req, res) => {
    try {
        let query = `SELECT * FROM komentar INNER JOIN lapor ON 
                    komentar.id_lapor_komentar = lapor.id_lapor AND komentar.id_lapor_komentar = ? 
                    INNER JOIN user ON komentar.id_user_komentar = user.id_user`;
        let result = await db.query(query, [req.params.id]);
        response.ok(result, res);
    } catch (error) {
        response.fail(error.message, res);
    }
});

router.post('/', verifyToken, async (req, res) => {
    try {
        let idlapor = req.body.idlapor;
        let iduser = req.user.userId;
        let desk = req.body.desk;
        let tgl = new Date();
        await db.query('INSERT INTO komentar (id_lapor_komentar, id_user_komentar, desk_komentar, tgl_komentar) values (?,?,?,?)',
            [ idlapor, iduser, desk, tgl ]);
            
        response.ok("Berhasil menambahkan komentar!", res);
    } catch (error) {
        res.status(500).json({message: error.message});
    }
});

router.put('/', verifyToken, async (req, res) => {
    try {
        let id = req.body.id;
        let desk = req.body.desk;
        let query = `UPDATE komentar SET desk_komentar = ? WHERE id_komentar = ?`;
        await db.query(query, [desk, id]);
            
        response.ok("Berhasil merubah komentar!", res);
    } catch (error) {
        res.status(500).json({message: error.message});
    }
});

router.delete('/:id', verifyToken, async (req, res) => {
    try {
        let id = req.params.id;
        let query = `DELETE FROM komentar WHERE id_komentar = ?`;
        await db.query(query, [id]);
            
        response.ok("Berhasil hapus komentar!", res);
    } catch (error) {
        res.status(500).json({message: error.message});
    }
});

router.get('/getid/:id', verifyToken, async (req, res) => {
    try {
        let query = `SELECT * FROM komentar WHERE komentar.id_komentar = ?`;
        let result = await db.query(query, [req.params.id]);
        response.ok(result, res);
    } catch (error) {
        response.fail(error.message, res);
    }
});

router.get('/getkomen/:id', async (req, res) => {
    try {
        let query = `SELECT id_komentar, id_user_komentar, id_lapor_komentar, desk_komentar, tgl_komentar,
                    nama_user, foto_user FROM komentar INNER JOIN lapor ON 
                    komentar.id_lapor_komentar = lapor.id_lapor AND komentar.id_lapor_komentar = ?
                    INNER JOIN user ON komentar.id_user_komentar = user.id_user`;
        let result = await db.query(query, [req.params.id]);
        response.ok(result, res);
    } catch (error) {
        response.fail(error.message, res);
    }
});


module.exports = router;