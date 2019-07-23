const sharp = require('sharp');
const response = require('../config/res');
const db = require('../config/db');
const customID = require('../helper/custom-id');

class IzinController {
    constructor() {
        this.iduser = null;
        this.surat = null;
        this.ktp = null;
        this.kk = null;
        this.desk = null;
        this.loc = null;
        this.tglmulai = null;
        this.tglend = null;
        this.jammulai = null;
        this.jamend = null;
        this.tgl = null;
        this.status = null;
    }

    async getCountIzin(req, res) {
        try {
            let query = `SELECT 
                            *, 
                            (SELECT COUNT(izin.status_izin) FROM izin WHERE izin.status_izin = 'Menunggu') 
                            AS total_menunggu, (SELECT COUNT(izin.status_izin) FROM izin WHERE izin.status_izin = 'Proses') 
                            AS total_proses, (SELECT COUNT(izin.status_izin) FROM izin WHERE izin.status_izin = 'Selesai') 
                            AS total_selesai, (SELECT COUNT(izin.status_izin) FROM izin WHERE izin.status_izin = 'Ditolak') 
                            AS total_ditolak 
                         FROM 
                            izin 
                        INNER JOIN 
                            user 
                        ON 
                            izin.id_user_izin = user.id_user
                         ORDER BY id_izin DESC`;
            let result = await db.query(query);
            response.ok(result, res);
        } catch (error) {
            console.log(error.message);
            res.status(500).json({message: error.message});
        }
    }
    
    async getIzinById(req, res) {
        try {
            let query = `SELECT * FROM izin INNER JOIN user ON izin.id_user_izin = user.id_user
                         AND izin.id_izin = ? ORDER BY id_izin DESC`;
            let result = await db.query(query, [req.params.id]);
            response.ok(result, res);
        } catch (error) {
            console.log(error.message);
            res.status(500).json({message: error.message});
        }
    }
    
    async getIzinUser(req, res) {
        try {
            let query = `SELECT * FROM izin INNER JOIN user ON izin.id_user_izin = user.id_user 
                        AND user.id_user = ? ORDER BY id_izin DESC`;
            let result = await db.query(query, [req.user.userId]);
            response.ok(result, res);
        } catch (error) {
            console.log(error.message);
            res.status(500).json({message: error.message});
        }
    }
    
    async getIzinUserDetail(req, res) {
        try {
            let query = `SELECT * FROM izin WHERE id_izin = ?`;
            let result = await db.query(query, [req.params.id]);
            response.ok(result, res);
        } catch (error) {
            console.log(error.message);
            res.status(500).json({message: error.message});
        }
    }
    
    async tambahIzin(req, res) {
        try {
            let pathSurat = req.files.fotoSurat[0].path.replace(/\\/g, "/");
            let pathKTP = req.files.fotoKTP[0].path.replace(/\\/g, "/");
            let pathKK = req.files.fotoKK[0].path.replace(/\\/g, "/");
    
            let resizeSurat = await sharp('./' + pathSurat).withMetadata().toBuffer();
            await sharp(resizeSurat).withMetadata().resize(1080).toFile('./' + pathSurat);
    
            let resizeKTP = await sharp('./' + pathKTP).withMetadata().toBuffer();
            await sharp(resizeKTP).withMetadata().resize(1080).toFile('./' + pathKTP);
    
            let resizeKK = await sharp('./' + pathKK).withMetadata().toBuffer();
            await sharp(resizeKK).withMetadata().resize(1080).toFile('./' + pathKK);
            
            let kode = await customID('izin', 'kode_izin', 'IZN-', 4);
    
            this.iduser = req.user.userId;
            this.surat = '/' + pathSurat;
            this.ktp = '/' + pathKTP;
            this.kk = '/' + pathKK;
            this.desk = req.body.desk;
            this.loc = req.body.loc;
            this.tglmulai = req.body.tglmulai;
            this.tglend = req.body.tglend;
            this.jammulai = req.body.jammulai;
            this.jamend = req.body.jamend;
            this.tgl = new Date();
            this.status = 'Menunggu';
    
            let result = await db.query('INSERT INTO izin (id_user_izin, kode_izin, surat_izin, ktp_izin, kk_izin, kegiatan_izin, lokasi_izin, tgl_mulai_izin, tgl_selesai_izin, jam_mulai_izin, jam_selesai_izin, tgl_izin, status_izin) values (?,?,?,?,?,?,?,?,?,?,?,?,?)',
            [ this.iduser, kode, this.surat, this.ktp, this.kk, this.desk, this.loc, this.tglmulai, this.tglend, this.jammulai, this.jamend, this.tgl, this.status ]);
                
            response.ok(result, res);
        } catch (error) {
            console.log(error.message);
            res.status(500).json({message: error.message});
        }
    }
    
    async editIzin(req, res) {
        try {
            let query = await db.query('UPDATE izin SET status_izin = ?, pesan_tolak_izin = ? WHERE id_izin = ?', 
            [req.body.status, req.body.pesan, req.params.id]);
            response.ok(query, res);
        } catch (error) {
            console.log(error.message);
            res.status(500).json({message: error.message});
            
        }
    }
}

module.exports = IzinController