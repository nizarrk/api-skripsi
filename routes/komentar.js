const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
const verifyToken = require('../helper/verify-token');
const Komentar = require('../controllers/komentar_controller');
const newkomentar = new Komentar();

router.use(bodyParser.urlencoded({ limit: "50mb", extended: true, parameterLimit: 50000 }));
router.use(bodyParser.json({ limit: "50mb" }));

router.get('/:id', verifyToken, (req, res) => {
    newkomentar.getKomentar(req, res);
});

router.post('/', verifyToken, (req, res) => {
    newkomentar.addKomentar(req, res);
});

router.put('/', verifyToken, (req, res) => {
    newkomentar.editKomentar(req, res);
});

router.delete('/:id', verifyToken, (req, res) => {
    newkomentar.deleteKomentar(req, res);
});

router.get('/getid/:id', verifyToken, (req, res) => {
    newkomentar.getKomentarbyId(req, res);
});

module.exports = router;