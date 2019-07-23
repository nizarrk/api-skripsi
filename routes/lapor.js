const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
const upload = require('../helper/upload-image');
const verifyToken = require('../helper/verify-token');
const Lapor = require('../controllers/lapor_controller');
const newlapor = new Lapor();

router.use(bodyParser.urlencoded({ limit: "50mb", extended: true, parameterLimit: 50000 }));
router.use(bodyParser.json({ limit: "50mb" }));

router.get('/searchloc/:cari', verifyToken, (req, res) => {
    newlapor.cariLaporan(req, res);
});

router.get('/getall', verifyToken, (req, res) => {
    newlapor.lihatLaporan(req, res);
});

router.get('/getid/:id', verifyToken, (req, res) => {
    newlapor.getLaporanById(req, res);
});

router.put('/status/:id', verifyToken, (req, res) => {
    newlapor.updateStatusLaporan(req, res);
})

router.get('/vote/:id', verifyToken, (req, res) => {
    newlapor.getVoteLaporan(req, res);
});

router.post('/vote', verifyToken, (req, res) => {
    newlapor.voteLaporan(req, res);
});

router.delete('/vote/:id', (req, res) => {
    newlapor.deleteVoteLaporan(req, res);
});

router.get('/', verifyToken, (req, res) => {
    newlapor.getlaporanBeranda(req, res);
});

router.get('/laporku', verifyToken, (req, res) => {
    newlapor.getLaporanByUser(req, res);
});

router.get('/:id', verifyToken, (req, res) => {
    newlapor.getLaporanDetail(req, res);
});

router.post('/geocode', verifyToken, (req, res) => {
    newlapor.geocode(req, res);
});

router.post('/', verifyToken, upload.single('fotoLapor'), (req, res) => {
    newlapor.tambahLaporan(req, res);
});

router.post('/piexif', upload.single('fotoLapor'), (req, res) => {
    newlapor.piexif(req, res);
});

router.put('/:id', verifyToken, (req, res) => {
    newlapor.editLaporan(req, res);
});

module.exports = router;