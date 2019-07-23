const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
const verifyToken = require('../helper/verify-token');
const KritikSaran = require('../controllers/kritiksaran_controller');
const newkritiksaran = new KritikSaran();

router.use(bodyParser.urlencoded({ extended: true }));
router.use(bodyParser.json());

router.get('/', verifyToken, (req, res) => {
    newkritiksaran.lihatKritikSaran(req, res);
});

router.get('/:id', verifyToken, (req, res) => {
    newkritiksaran.getKritikSaranById(req, res);
});

router.post('/', verifyToken, (req, res) => {
    newkritiksaran.tambahKritikSaran(req, res);
});

module.exports = router;