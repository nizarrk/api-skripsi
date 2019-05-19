const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
const upload = require('../middleware/upload-image');
const response = require('../config/res');
const db = require('../config/db');
const verifyToken = require('../middleware/verify-token');

router.use(bodyParser.urlencoded({ limit: "50mb", extended: true, parameterLimit: 50000 }));
router.use(bodyParser.json({ limit: "50mb" }));

router.post('/', (req, res) => {
    console.log(req.body);
    
});

module.exports = router;