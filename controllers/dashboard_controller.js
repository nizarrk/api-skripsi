const response = require('../config/res');
const db = require('../config/db');

class DashboardController {
    constructor() {

    }

    async countSurvey(req, res) {
        try {
            let query = `SELECT id_survey, id_user_survey FROM survey GROUP BY id_user_survey`;
            let result = await db.query(query);
            response.ok(result, res);
        } catch (error) {
            console.log(error.message);
        }
    }
    
    async countKritik(req, res) {
        try {
            let query = `SELECT COUNT(id_kritiksaran) AS total FROM kritiksaran`;
            let result = await db.query(query);
            response.ok(result, res);
        } catch (error) {
            console.log(error.message);
        }
    }
    
    async countLapor(req, res) {
        try {
            let query = `SELECT COUNT(id_lapor) AS total FROM lapor`;
            let result = await db.query(query);
            response.ok(result, res);
        } catch (error) {
            console.log(error.message);
        }
    }
    
    async countLaporMenunggu(req, res) {
        try {
            let query = `SELECT COUNT(id_lapor) AS menunggu FROM lapor WHERE status_lapor = 'Menunggu'`;
            let result = await db.query(query);
            response.ok(result, res);
        } catch (error) {
            console.log(error.message);
        }
    }
    
    async countLaporProses(req, res) {
        try {
            let query = `SELECT COUNT(id_lapor) AS proses FROM lapor WHERE status_lapor = 'Proses'`;
            let result = await db.query(query);
            response.ok(result, res);
        } catch (error) {
            console.log(error.message);
        }
    }
    
    async countLaporSelesai(req, res) {
        try {
            let query = `SELECT COUNT(id_lapor) AS selesai FROM lapor WHERE status_lapor = 'Selesai'`;
            let result = await db.query(query);
            response.ok(result, res);
        } catch (error) {
            console.log(error.message);
        }
    }
    
    async countLaporDitolak(req, res) {
        try {
            let query = `SELECT COUNT(id_lapor) AS ditolak FROM lapor WHERE status_lapor = 'Ditolak'`;
            let result = await db.query(query);
            response.ok(result, res);
        } catch (error) {
            console.log(error.message);
        }
    }
    
    async countIzin(req, res) {
        try {
            let query = `SELECT COUNT(id_izin) AS total FROM izin`;
            let result = await db.query(query);
            response.ok(result, res);
        } catch (error) {
            console.log(error.message);
        }
    }
    
    async countIzinMenunggu(req, res) {
        try {
            let query = `SELECT COUNT(id_izin) AS menunggu FROM izin WHERE status_izin = 'Menunggu'`;
            let result = await db.query(query);
            response.ok(result, res);
        } catch (error) {
            console.log(error.message);
        }
    }
    
    async countIzinProses(req, res) {
        try {
            let query = `SELECT COUNT(id_izin) AS proses FROM izin WHERE status_izin = 'Proses'`;
            let result = await db.query(query);
            response.ok(result, res);
        } catch (error) {
            console.log(error.message);
        }
    }
    
    async countIzinSelesai(req, res) {
        try {
            let query = `SELECT COUNT(id_izin) AS selesai FROM izin WHERE status_izin = 'Selesai'`;
            let result = await db.query(query);
            response.ok(result, res);
        } catch (error) {
            console.log(error.message);
        }
    }
    
    async countIzinDitolak(req, res) {
        try {
            let query = `SELECT COUNT(id_izin) AS ditolak FROM izin WHERE status_izin = 'Ditolak'`;
            let result = await db.query(query);
            response.ok(result, res);
        } catch (error) {
            console.log(error.message);
        }
    }
}

module.exports = DashboardController;