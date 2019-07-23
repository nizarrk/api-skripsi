const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
const verifyToken = require('../helper/verify-token');
const Notif = require('../controllers/notifikasi_controller');
const newnotif = new Notif();

router.use(bodyParser.urlencoded({ limit: "50mb", extended: true, parameterLimit: 50000 }));
router.use(bodyParser.json({ limit: "50mb" }));

router.get('/limit', verifyToken, (req, res) => {
    newnotif.getNotifLimit(req, res);
});

router.get('/', verifyToken, (req, res) => {
    newnotif.getNotif(req, res);
});

router.get('/count', verifyToken, (req, res) => {
    newnotif.countNotif(req, res);
});

router.post('/', verifyToken, (req, res) => {
    newnotif.addNotif(req, res);
});

router.put('/:id', verifyToken, (req, res) => {
    newnotif.updateStatusNotif(req, res);
});

module.exports = router;