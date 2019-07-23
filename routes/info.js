const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
const upload = require('../helper/upload-image');
const verifyToken = require('../helper/verify-token');
const Info = require('../controllers/info_controller');
const newinfo = new Info();

router.use(bodyParser.urlencoded({ limit: "50mb", extended: true, parameterLimit: 50000 }));
router.use(bodyParser.json({ limit: "50mb" }));

router.get('/trayek', verifyToken, (req, res) => {
    newinfo.lihatInfoTrayek(req, res);
});

router.get('/', verifyToken, (req, res) => {
    newinfo.lihatInfo(req, res);
});

router.get('/:id', verifyToken, (req, res) => {
    newinfo.getInfoById(req, res);
});

router.get('/trayek/:id', verifyToken, (req, res) => {
    newinfo.getTrayekById(req, res);
});

router.post('/trayek', verifyToken, (req, res) => {
    newinfo.addTrayek(req, res);
});

router.put('/trayek', verifyToken, (req, res) => {
    newinfo.editTrayek(req, res);
});

router.delete('/trayek/:id', verifyToken, (req, res) => {
    newinfo.deleteTrayek(req, res);
});

router.post('/', verifyToken, upload.single('fotoInfo'), (req, res) => {
    newinfo.addInfo(req, res);
});

router.put('/', verifyToken, upload.single('fotoInfo'), (req, res) => {
    newinfo.editInfo(req, res);
});

router.delete('/:id', verifyToken, (req, res) => {
    newinfo.deleteInfo(req, res);
});

module.exports = router;