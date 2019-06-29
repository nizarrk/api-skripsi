const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
const response = require('../config/res');
const db = require('../config/db');
const verifyToken = require('../helper/verify-token');

router.use(bodyParser.urlencoded({ extended: true }));
router.use(bodyParser.json());

router.get('/survey', verifyToken, async (req, res) => {
    try {
        let query = `SELECT id_survey, id_user_survey FROM survey GROUP BY id_user_survey`;
        let result = await db.query(query);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
    }
});

router.get('/kritik', verifyToken, async (req, res) => {
    try {
        let query = `SELECT COUNT(id_kritiksaran) AS total FROM kritiksaran`;
        let result = await db.query(query);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
    }
});

router.get('/lapor', verifyToken, async (req, res) => {
    try {
        let query = `SELECT COUNT(id_lapor) AS total FROM lapor`;
        let result = await db.query(query);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
    }
});

router.get('/lapor/menunggu', verifyToken, async (req, res) => {
    try {
        let query = `SELECT COUNT(id_lapor) AS menunggu FROM lapor WHERE status_lapor = 'Menunggu'`;
        let result = await db.query(query);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
    }
});

router.get('/lapor/proses', verifyToken, async (req, res) => {
    try {
        let query = `SELECT COUNT(id_lapor) AS proses FROM lapor WHERE status_lapor = 'Proses'`;
        let result = await db.query(query);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
    }
});

router.get('/lapor/selesai', verifyToken, async (req, res) => {
    try {
        let query = `SELECT COUNT(id_lapor) AS selesai FROM lapor WHERE status_lapor = 'Selesai'`;
        let result = await db.query(query);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
    }
});

router.get('/lapor/ditolak', verifyToken, async (req, res) => {
    try {
        let query = `SELECT COUNT(id_lapor) AS ditolak FROM lapor WHERE status_lapor = 'Ditolak'`;
        let result = await db.query(query);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
    }
});

router.get('/izin', verifyToken, async (req, res) => {
    try {
        let query = `SELECT COUNT(id_izin) AS total FROM izin`;
        let result = await db.query(query);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
    }
});

router.get('/izin/menunggu', verifyToken, async (req, res) => {
    try {
        let query = `SELECT COUNT(id_izin) AS menunggu FROM izin WHERE status_izin = 'Menunggu'`;
        let result = await db.query(query);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
    }
});

router.get('/izin/proses', verifyToken, async (req, res) => {
    try {
        let query = `SELECT COUNT(id_izin) AS proses FROM izin WHERE status_izin = 'Proses'`;
        let result = await db.query(query);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
    }
});

router.get('/izin/selesai', verifyToken, async (req, res) => {
    try {
        let query = `SELECT COUNT(id_izin) AS selesai FROM izin WHERE status_izin = 'Selesai'`;
        let result = await db.query(query);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
    }
});

router.get('/izin/ditolak', verifyToken, async (req, res) => {
    try {
        let query = `SELECT COUNT(id_izin) AS ditolak FROM izin WHERE status_izin = 'Ditolak'`;
        let result = await db.query(query);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
    }
});

module.exports = router;