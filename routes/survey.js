const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
const verifyToken = require('../helper/verify-token');
const Survey = require('../controllers/survey_controller');
const newsurvey = new Survey();

router.use(bodyParser.urlencoded({ limit: "50mb", extended: true, parameterLimit: 50000 }));
router.use(bodyParser.json({ limit: "50mb" }));

router.get('/hasil', verifyToken, (req, res) => {
    newsurvey.hasilSurvey(req, res);
});

router.get('/list', verifyToken, (req, res) => {
    newsurvey.getSurvey(req, res);
});

router.post('/submit', verifyToken, (req, res) => {
    newsurvey.submitSurvey(req, res);
});

router.get('/list/:id', verifyToken, (req, res) => {
    newsurvey.getSurveyById(req, res);
});

router.put('/list', verifyToken, (req, res) => {
    newsurvey.editSurvey(req, res);
});

router.get('/', verifyToken, (req, res) => {
    newsurvey.getMasterSurvey(req, res);
});

router.get('/:id', verifyToken, (req, res) => {
    newsurvey.getMasterSurveyById(req, res);
});

router.post('/', verifyToken, (req, res) => {
    newsurvey.addMasterPertanyaan(req, res);
});

router.post('/jawaban', verifyToken, (req, res) => {
    newsurvey.addMasterjawaban(req, res);
});

router.post('/addall', verifyToken, (req, res) => {
    newsurvey.addAllMasterToSurvey(req, res);
});

router.post('/addsurvey', verifyToken, (req, res) => {
    newsurvey.addMasterToSurvey(req, res);
});

router.put('/', verifyToken, (req, res) => {
    newsurvey.editMasterSurvey(req, res);
});

router.delete('/:id', verifyToken, (req, res) => {
    newsurvey.deleteMasterSurvey(req, res);
});

router.delete('/list/:id', verifyToken, (req, res) => {
    newsurvey.deleteSurvey(req, res);
});

module.exports = router;