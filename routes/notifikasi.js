const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
const verifyToken = require('../helper/verify-token');
const notif = require('../controllers/notifikasi_controller');

router.use(bodyParser.urlencoded({ limit: "50mb", extended: true, parameterLimit: 50000 }));
router.use(bodyParser.json({ limit: "50mb" }));

router.get('/limit', verifyToken, notif.getNotifLimit);

router.get('/', verifyToken, notif.getNotif);

router.get('/count', verifyToken, notif.countNotif);

router.post('/', verifyToken, notif.addNotif);

router.put('/:id', verifyToken, notif.updateStatusNotif);

module.exports = router;