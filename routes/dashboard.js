const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
const verifyToken = require('../helper/verify-token');
const Dashboard = require('../controllers/dashboard_controller');
const newdashboard = new Dashboard();

router.use(bodyParser.urlencoded({ extended: true }));
router.use(bodyParser.json());

router.get('/survey', verifyToken, (req, res) => {
    newdashboard.countSurvey(req, res);
});

router.get('/kritik', verifyToken, (req, res) => {
    newdashboard.countKritik(req, res);
});

router.get('/lapor', verifyToken, (req, res) => {
    newdashboard.countLapor(req, res);
});

router.get('/lapor/menunggu', verifyToken, (req, res) => {
    newdashboard.countLaporMenunggu(req, res);
});

router.get('/lapor/proses', verifyToken, (req, res) => {
    newdashboard.countLaporProses(req, res);
});

router.get('/lapor/selesai', verifyToken, (req, res) => {
    newdashboard.countLaporSelesai(req, res);
});

router.get('/lapor/ditolak', verifyToken, (req, res) => {
    newdashboard.countLaporDitolak(req, res);
});

router.get('/izin', verifyToken, (req, res) => {
    newdashboard.countIzin(req, res);
});

router.get('/izin/menunggu', verifyToken, (req, res) => {
    newdashboard.countIzinMenunggu(req, res);
});

router.get('/izin/proses', verifyToken, (req, res) => {
    newdashboard.countIzinProses(req, res);
});

router.get('/izin/selesai', verifyToken, (req, res) => {
    newdashboard.countIzinSelesai(req, res);
});

router.get('/izin/ditolak', verifyToken, (req, res) => {
    newdashboard.countIzinDitolak(req, res);
});

module.exports = router;