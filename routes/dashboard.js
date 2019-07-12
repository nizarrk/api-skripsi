const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
const verifyToken = require('../helper/verify-token');
const dashboard = require('../controllers/dashboard_controller');

router.use(bodyParser.urlencoded({ extended: true }));
router.use(bodyParser.json());

router.get('/survey', verifyToken, dashboard.countSurvey);

router.get('/kritik', verifyToken, dashboard.countKritik);

router.get('/lapor', verifyToken, dashboard.countLapor);

router.get('/lapor/menunggu', verifyToken, dashboard.countLaporMenunggu);

router.get('/lapor/proses', verifyToken, dashboard.countLaporProses);

router.get('/lapor/selesai', verifyToken, dashboard.countLaporSelesai);

router.get('/lapor/ditolak', verifyToken, dashboard.countLaporDitolak);

router.get('/izin', verifyToken, dashboard.countIzin);

router.get('/izin/menunggu', verifyToken, dashboard.countIzinMenunggu);

router.get('/izin/proses', verifyToken, dashboard.countIzinProses);

router.get('/izin/selesai', verifyToken, dashboard.countIzinSelesai);

router.get('/izin/ditolak', verifyToken, dashboard.countIzinDitolak);

module.exports = router;