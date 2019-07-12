const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
const upload = require('../helper/upload-image');
const verifyToken = require('../helper/verify-token');
const izin = require('../controllers/izin_controller');

router.use(bodyParser.urlencoded({ limit: "50mb", extended: true, parameterLimit: 50000 }));
router.use(bodyParser.json({ limit: "50mb" }));

router.get('/getall', verifyToken, izin.getCountIzin);

router.get('/getall/:id', verifyToken, izin.getIzinById);

router.get('/', verifyToken, izin.getIzinUser);
router.get('/:id', verifyToken, izin.getIzinUserDetail);

router.post('/', verifyToken, upload.fields([{name: 'fotoSurat'}, {name: 'fotoKTP'}, {name: 'fotoKK'}]), izin.addIzinUser);

router.put('/:id', verifyToken, izin.editIzinUser)

module.exports = router;