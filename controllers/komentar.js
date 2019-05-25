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
                    INNER JOIN user on komentar.id_user_komentar = user.id_user`;
        let result = await db.query(query, [req.params.id]);
        response.ok(result, res);
    } catch (error) {
        response.fail(error.message, res);
    }
});

router.post('/', async (req, res) => {
    try {
        let idlapor = req.body.idlapor;
        let iduser = req.body.iduser;
        let desk = req.body.desk;
        await db.query('INSERT INTO komentar (id_lapor_komentar, id_user_komentar, desk_komentar) values (?,?,?)',
            [ idlapor, iduser, desk  ]);
            
        response.ok("Berhasil menambahkan lapor!", res);
    } catch (error) {
        response.fail(error.message, res);
    }
});

module.exports = router;