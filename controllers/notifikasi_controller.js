const response = require('../config/res');
const db = require('../config/db');

class NotifikasiController {
    constructor() {
        this.user = null;
        this.kode = null;
        this.tipe = null;
        this.desk = null;
        this.tgl = null;
        this.status = null;
    }

    async getNotifLimit(req, res) {
        try {
            let query = `SELECT 
                            notifikasi.id_notifikasi, notifikasi.id_user_notifikasi, notifikasi.id_user_notifikator,
                            notifikasi.tipe_notifikasi, notifikasi.desk_notifikasi, notifikasi.tgl_notifikasi,
                            notifikasi.status_notifikasi, user.nama_user AS nama_user_notifikator, lapor.id_lapor 
                        FROM 
                            notifikasi 
                        INNER JOIN 
                            user 
                        ON 
                            notifikasi.id_user_notifikator = user.id_user AND notifikasi.id_user_notifikasi = ? 
                        LEFT JOIN 
                            lapor 
                        ON 
                            notifikasi.kode_notifikasi = lapor.id_lapor
                        ORDER BY
                            notifikasi.id_notifikasi
                        DESC
                        LIMIT
                            5`;
            let result = await db.query(query, [req.user.userId]);
            response.ok(result, res);
        } catch (error) {
            console.log(error.message);
            
        }
    }
    
    async getNotif(req, res) {
        try {
            let query = `SELECT 
                            notifikasi.id_notifikasi, notifikasi.id_user_notifikasi, notifikasi.id_user_notifikator,
                            notifikasi.tipe_notifikasi, notifikasi.desk_notifikasi, notifikasi.tgl_notifikasi,
                            notifikasi.status_notifikasi, user.nama_user AS nama_user_notifikator, lapor.id_lapor 
                        FROM 
                            notifikasi 
                        INNER JOIN 
                            user 
                        ON 
                            notifikasi.id_user_notifikator = user.id_user AND notifikasi.id_user_notifikasi = ? 
                        LEFT JOIN 
                            lapor 
                        ON 
                            notifikasi.kode_notifikasi = lapor.id_lapor
                        ORDER BY
                            notifikasi.id_notifikasi
                        DESC`;
            let result = await db.query(query, [req.user.userId]);
            response.ok(result, res);
        } catch (error) {
            console.log(error.message);
            
        }
    }
    
    async countNotif(req, res) {
        try {
            let query = `SELECT 
                            COUNT(id_notifikasi) AS count 
                        FROM 
                            notifikasi 
                        WHERE 
                            id_user_notifikasi = ? 
                        AND 
                            status_notifikasi = "Aktif"`;
            let result = await db.query(query, [req.user.userId]);
            response.ok(result, res);
        } catch (error) {
            console.log(error.message);
            
        }
    }
    
    async addNotif(req, res) {
        try {
            let query = `INSERT INTO 
                            notifikasi 
                            (id_user_notifikasi, id_user_notifikator, kode_notifikasi, tipe_notifikasi, desk_notifikasi, tgl_notifikasi, status_notifikasi) 
                        VALUES (?,?,?,?,?,?,?)`;
            let result = await db.query(query, [req.body.user, req.body.id, req.body.kode, req.body.tipe, req.body.desk, new Date(), req.body.status]);
            response.ok(result, res);
        } catch (error) {
            console.log(error.message);
            
        }
    }
    
    async updateStatusNotif(req, res) {
        try {
            let query = `UPDATE
                            notifikasi
                        SET
                            status_notifikasi = ?
                        WHERE id_notifikasi = ?`;
            
            let result = await db.query(query, [req.body.status, req.params.id]);
            response.ok(result, res);
        } catch (error) {
            console.log(error.message);
            
        }
    }
}

module.exports = NotifikasiController;