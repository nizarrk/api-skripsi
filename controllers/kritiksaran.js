const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
const response = require('../config/res');
const db = require('../config/db');
const verifyToken = require('../helper/verify-token');

router.use(bodyParser.urlencoded({ extended: true }));
router.use(bodyParser.json());

router.get('/', verifyToken, async (req, res) => {
    try {
        let query = `SELECT kritiksaran.id_kritiksaran, kritiksaran.rate_kritiksaran, kritiksaran.desk_kritiksaran,
                    kritiksaran.tgl_kritiksaran, user.id_user, user.nama_user FROM kritiksaran INNER JOIN user
                    ON kritiksaran.id_user_kritiksaran = user.id_user ORDER BY id_kritiksaran DESC`;
        let result = await db.query(query);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
    }
});

router.get('/:id', verifyToken, async (req, res) => {
    try {
        let id = req.body.id;

        let result = await db.query('SELECT * FROM info WHERE id_kritiksaran = ?', [id]);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
    }
});

router.post('/', verifyToken, async (req, res) => {
    try {        
        let user = req.user.userId;
        let rate = req.body.rate;
        let desk = req.body.desk;
        let tgl = new Date();

        console.log(user, rate, desk, tgl);
        

        let result = await db.query('INSERT INTO kritiksaran (id_user_kritiksaran, rate_kritiksaran, desk_kritiksaran, tgl_kritiksaran) values (?,?,?,?)', 
        [user, rate, desk, tgl]);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
    }
});

module.exports = router;