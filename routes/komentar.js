const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
const verifyToken = require('../helper/verify-token');
const komentar = require('../controllers/komentar_controller');

router.use(bodyParser.urlencoded({ limit: "50mb", extended: true, parameterLimit: 50000 }));
router.use(bodyParser.json({ limit: "50mb" }));

router.get('/:id', verifyToken, komentar.getKomentar);

router.post('/', verifyToken, komentar.addKomentar);

router.put('/', verifyToken, komentar.editKomentar);

router.delete('/:id', verifyToken, komentar.deleteKomentar);

router.get('/getid/:id', verifyToken, komentar.getKomentarbyId);

module.exports = router;