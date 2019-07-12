const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
const upload = require('../helper/upload-image');
const verifyToken = require('../helper/verify-token');
const user = require('../controllers/user_controller');

router.use(bodyParser.urlencoded({ extended: true }));
router.use(bodyParser.json());

router.post('/register', upload.single('fotoUser'), user.register);

router.post('/login', user.login);

router.get('/', user.getAllUser);

router.get('/profile', verifyToken, user.profile);

router.post('/', user.addUser);

router.put('/pass', verifyToken, user.editPass);

router.put('/:id', verifyToken, upload.single('fotoUser'), user.editProfile);


router.delete('/:id', user.deleteUser);

module.exports = router;