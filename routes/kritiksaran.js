const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
const verifyToken = require('../helper/verify-token');
const kritik = require('../controllers/kritiksaran_controller');

router.use(bodyParser.urlencoded({ extended: true }));
router.use(bodyParser.json());

router.get('/', verifyToken, kritik.lihatKritikSaran);

router.get('/:id', verifyToken, kritik.getKritikSaranById);

router.post('/', verifyToken, kritik.addKritikSaran);

module.exports = router;