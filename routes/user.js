const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
const upload = require('../helper/upload-image');
const verifyToken = require('../helper/verify-token');
const User = require('../controllers/user_controller');
const newuser = new User();
router.use(bodyParser.urlencoded({ extended: true }));
router.use(bodyParser.json());

router.post('/register', upload.single('fotoUser'), (req, res) => {
    newuser.register(req, res);
});

router.post('/login', (req, res) => {
    newuser.login(req, res);
});

router.get('/', (req, res) => {
    newuser.getAllUser(req, res);
});

router.get('/profile', verifyToken, (req, res) => {
    newuser.profile(req, res);
});

router.post('/', (req, res) => {
    newuser.addUser(req, res);
});

router.put('/pass', verifyToken, (req, res) => {
    newuser.editPass(req, res)
});

router.put('/:id', verifyToken, upload.single('fotoUser'), (req, res) => {
    newuser.editProfile(req, res);
});


router.delete('/:id', (req, res) => {
    newuser.deleteUser(req, res);
});

module.exports = router;