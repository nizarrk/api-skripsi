const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
const verifyToken = require('../helper/verify-token');
const survey = require('../controllers/survey_controller');

router.use(bodyParser.urlencoded({ limit: "50mb", extended: true, parameterLimit: 50000 }));
router.use(bodyParser.json({ limit: "50mb" }));

router.get('/hasil', verifyToken, survey.hasilSurvey);

router.get('/list', verifyToken, survey.getSurvey);

router.post('/submit', verifyToken, survey.submitSurvey);

router.get('/list/:id', verifyToken, survey.getSurveyById);

router.put('/list', verifyToken, survey.editSurvey);

router.get('/', verifyToken, survey.getMasterSurvey);

router.get('/:id', verifyToken, survey.getMasterSurveyById);

router.post('/', verifyToken, survey.addMasterPertanyaan);

router.post('/jawaban', verifyToken, survey.addMasterjawaban);

router.post('/addall', verifyToken, survey.addAllMasterToSurvey);

router.post('/addsurvey', verifyToken, survey.addMasterToSurvey);

router.put('/', verifyToken, survey.editMasterSurvey);

router.delete('/:id', verifyToken, survey.deleteMasterSurvey);

router.delete('/list/:id', verifyToken, survey.deleteSurvey);

module.exports = router;