const response = require('../config/res');
const db = require('../config/db');

class KomentarController {
    constructor() {
        this.idlapor = null;
        this.iduser = null;
        this.desk = null;
        this.tgl = null;
    }

    async getKomentar(req, res) {
        try {
            let query = `SELECT * FROM komentar INNER JOIN lapor ON 
                        komentar.id_lapor_komentar = lapor.id_lapor AND komentar.id_lapor_komentar = ? 
                        INNER JOIN user ON komentar.id_user_komentar = user.id_user`;
            let result = await db.query(query, [req.params.id]);
            response.ok(result, res);
        } catch (error) {
            response.fail(error.message, res);
        }
    }
    
    async addKomentar(req, res) {
        try {
            this.idlapor = req.body.idlapor;
            this.iduser = req.user.userId;
            this.desk = req.body.desk;
            this.tgl = new Date();
            await db.query('INSERT INTO komentar (id_lapor_komentar, id_user_komentar, desk_komentar, tgl_komentar) values (?,?,?,?)',
                [ this.idlapor, this.iduser, this.desk, this.tgl ]);
                
            response.ok("Berhasil menambahkan komentar!", res);
        } catch (error) {
            res.status(500).json({message: error.message});
        }
    }
    
    async editKomentar(req, res) {
        try {
            let id = req.body.id;
            this.desk = req.body.desk;
            this.query = `UPDATE komentar SET desk_komentar = ? WHERE id_komentar = ?`;
            await db.query(query, [this.desk, this.id]);
                
            response.ok("Berhasil merubah komentar!", res);
        } catch (error) {
            res.status(500).json({message: error.message});
        }
    }
    
    async deleteKomentar(req, res) {
        try {
            let id = req.params.id;
            let query = `DELETE FROM komentar WHERE id_komentar = ?`;
            await db.query(query, [id]);
                
            response.ok("Berhasil hapus komentar!", res);
        } catch (error) {
            res.status(500).json({message: error.message});
        }
    }
    
    async getKomentarbyId(req, res) {
        try {
            let query = `SELECT * FROM komentar WHERE komentar.id_komentar = ?`;
            let result = await db.query(query, [req.params.id]);
            response.ok(result, res);
        } catch (error) {
            response.fail(error.message, res);
        }
    }
}

module.exports = KomentarController;