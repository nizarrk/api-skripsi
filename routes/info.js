const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
const upload = require('../helper/upload-image');
const verifyToken = require('../helper/verify-token');
const info = require('../controllers/info_controller');

router.use(bodyParser.urlencoded({ limit: "50mb", extended: true, parameterLimit: 50000 }));
router.use(bodyParser.json({ limit: "50mb" }));

router.get('/trayek', verifyToken, info.getInfoTrayek);

router.get('/', verifyToken, info.getInfo);

router.get('/:id', verifyToken, info.getInfoById);

router.get('/trayek/:id', verifyToken, info.getTrayekById);

router.post('/trayek', verifyToken, info.addTrayek);

router.put('/trayek', verifyToken, info.editTrayek);

router.delete('/trayek/:id', verifyToken, info.deleteTrayek);

router.post('/', verifyToken, upload.single('fotoInfo'), info.addInfo);

router.put('/', verifyToken, upload.single('fotoInfo'), info.editInfo);

router.delete('/:id', verifyToken, info.deleteInfo);

module.exports = router;