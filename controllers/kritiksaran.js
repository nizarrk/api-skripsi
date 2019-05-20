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
        let result = await db.query('SELECT * FROM kritiksaran');
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
    }
});

router.get('/:id', async (req, res) => {
    try {
        let id = req.body.id;

        let result = await db.query('SELECT * FROM info WHERE id_kritiksaran = ?', [id]);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
    }
});

router.post('/', async (req, res) => {
    try {
        let user = req.body.user;
        let rate = req.file.rate;
        let desk = req.body.desk;

        let result = await db.query('INSERT INTO kritiksaran (id_user_kritiksaran, rate_kritiksaran, desk_kritiksaran) values (?,?,?)', 
        [user, rate, desk]);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
    }
});

module.exports = router;