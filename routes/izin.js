const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
const upload = require('../helper/upload-image');
const verifyToken = require('../helper/verify-token');
const Izin = require('../controllers/izin_controller');
const newizin = new Izin();

router.use(bodyParser.urlencoded({ limit: "50mb", extended: true, parameterLimit: 50000 }));
router.use(bodyParser.json({ limit: "50mb" }));

router.get('/getall', verifyToken, (req, res) => {
    newizin.getCountIzin(req, res);
});

router.get('/getall/:id', verifyToken, (req, res) => {
    newizin.getIzinById(req, res);
});

router.get('/', verifyToken, (req, res) => {
    newizin.getIzinUser(req, res);
});

router.get('/:id', verifyToken, (req, res) => {
    newizin.getIzinUserDetail(req, res);
});

router.post('/', verifyToken, upload.fields([{name: 'fotoSurat'}, {name: 'fotoKTP'}, {name: 'fotoKK'}]), (req, res) => {
    newizin.tambahIzin(req, res);
});

router.put('/:id', verifyToken, (req, res) => {
    newizin.editIzin(req, res);
});

module.exports = router;