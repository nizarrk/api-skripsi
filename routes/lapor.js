const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
const upload = require('../helper/upload-image');
const verifyToken = require('../helper/verify-token');
const lapor = require('../controllers/lapor_controller');

router.use(bodyParser.urlencoded({ limit: "50mb", extended: true, parameterLimit: 50000 }));
router.use(bodyParser.json({ limit: "50mb" }));

router.get('/searchloc/:cari', verifyToken, lapor.cariLaporan);

router.get('/getall', verifyToken, lapor.lihatLaporan);

router.get('/getid/:id', verifyToken, lapor.getLaporanById);

router.put('/status/:id', verifyToken, lapor.updateStatusLaporan)

router.get('/vote/:id', verifyToken, lapor.getVoteLaporan);

router.post('/vote', verifyToken, lapor.voteLaporan);

router.delete('/vote/:id', lapor.deleteVoteLaporan);

router.get('/', verifyToken, lapor.getlaporanBeranda);

router.get('/laporku', verifyToken, lapor.getLaporanByUser);

router.get('/:id', verifyToken, lapor.getLaporanDetail);

router.post('/geocode', verifyToken, lapor.geocode);

router.post('/', verifyToken, upload.single('fotoLapor'), lapor.tambahLaporan);

router.post('/piexif', upload.single('fotoLapor'), lapor.piexif);

router.put('/:id', verifyToken, lapor.editLaporan);

module.exports = router;