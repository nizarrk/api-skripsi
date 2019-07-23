// const sharp = require('sharp');
const response = require('../config/res');
const db = require('../config/db');

class InfoController {
    constructor() {
        this.nama = null;
        this.rute = null;
        this.latlng = null;
        this.jarak = null;
        this.status = null;
        this.judul = null;
        this.fotoInfo = null;
        this.desk = null;
        this.kat = null;
        this.tgl = null;
        this.author = null;
    }

    async lihatInfoTrayek(req, res) {
        try {
            let result = await db.query('SELECT * FROM trayek ORDER BY id_trayek DESC');
            response.ok(result, res);        
        } catch (error) {
            console.log(error.message);
            
        }
    }
    
    async lihatInfo(req, res) {
        try {
            let result = await db.query('SELECT * FROM info ORDER BY id_info DESC');
            response.ok(result, res);
        } catch (error) {
            console.log(error.message);
        }
    }
    
    async getInfoById(req, res) {
        try {
            let result = await db.query('SELECT * FROM info WHERE id_info = ?', 
            [req.params.id]);
            response.ok(result, res);
        } catch (error) {
            console.log(error.message);
        }
    }
    
    async getTrayekById(req, res) {
        try {
            let query = `SELECT * FROM trayek WHERE id_trayek = ?`;
            let id = req.params.id;
            let result =await db.query(query, [id]);
            response.ok(result, res);
        } catch (error) {
            console.log(error.message);
            
        }
    }
    
    async addTrayek(req, res) {
        try {
            this.nama = req.body.nama;
            this.rute = req.body.rute;
            this.latlng = JSON.stringify(req.body.latlng);
            this.jarak = req.body.jarak;
            this.status = 'Aktif';
    
            let result = await db.query('INSERT INTO trayek (nama_trayek, rute_trayek, latlng_trayek, jarak_trayek, status_trayek) VALUES (?,?,?,?,?)',
            [this.nama, this.rute, this.latlng, this.jarak, this.status]);
            response.ok(result, res);
        } catch (error) {
            console.log(error.message);
            
        }
    }
    
    async editTrayek(req, res) {
        try {
            console.log(req.body);
            let id = req.body.id;
            this.nama = req.body.nama;
            this.rute = req.body.rute;
            this.latlng = JSON.stringify(req.body.latlng);
            this.jarak = req.body.jarak;
            this.status = 'Aktif';
            
            let result = await db.query('UPDATE trayek SET nama_trayek = ?, rute_trayek = ?, latlng_trayek = ?, jarak_trayek = ?, status_trayek = ? WHERE id_trayek = ?',
            [this.nama, this.rute, this.latlng, this.jarak, this.status, id]);
            response.ok(result, res);
        } catch (error) {
            console.log(error.message);
            
        }
    }
    
    async deleteTrayek(req, res) {
        try {
            let id = req.params.id;
    
            let result = await db.query('DELETE FROM trayek WHERE id_trayek = ?', [id]);
            response.ok(result, res);
        } catch (error) {
            console.log(error.message);
        }
    }
    
    async addInfo(req, res) {
        try {
            let path = req.file.path.replace(/\\/g, "/");
    
            // let resize = await sharp('./' + path).withMetadata().toBuffer();
            // await sharp(resize).withMetadata().resize(1080).toFile('./' + path);
            
            this.judul = req.body.judul;
            this.fotoInfo = '/' + path;
            this.desk = req.body.desk;
            this.kat = req.body.kat;
            this.tgl = new Date();
            this.author = req.body.author;
    
            let result = await db.query('INSERT INTO info (judul_info, foto_info, desk_info, kat_info, tgl_info, author_info) VALUES (?,?,?,?,?,?)', 
            [this.judul, this.fotoInfo, this.desk, this.kat, this.tgl, this.author]);
            response.ok(result, res);
        } catch (error) {
            console.log(error.message);
        }
    }
    
    async editInfo(req, res) {
        try {
            let id = req.body.id;
            this.judul = req.body.judul;
            this.desk = req.body.desk;
            this.kat = req.body.kat;
            this.author = req.body.author;
            if (req.file == undefined) {
                let result = await db.query('UPDATE info SET judul_info = ?, desk_info = ?, kat_info = ?, author_info = ? WHERE id_info = ?', 
                [this.judul, this.desk, this.kat, this.author, id]);
                response.ok(result, res);
            } else {
                let path = req.file.path.replace(/\\/g, "/");
    
                // let resize = await sharp('./' + path).withMetadata().toBuffer();
                // await sharp(resize).withMetadata().resize(1080).toFile('./' + path);
    
                let id = req.body.id;
                this.judul = req.body.judul;
                this.fotoInfo = '/' + path;
                this.desk = req.body.desk;
                this.kat = req.body.kat;
                this.author = req.body.author;
                
                let result = await db.query('UPDATE info SET judul_info = ?, foto_info = ?, desk_info = ?, kat_info = ?, author_info = ? WHERE id_info = ?', 
                [this.judul, this.fotoInfo, this.desk, this.kat, this.tgl, this.author, id]);
                response.ok(result, res);
            }
        } catch (error) {
            console.log(error.message);
            res.status(500).json({message: error.message});
        }
    }
    
    async deleteInfo(req, res) {
        try {
            let id = req.params.id;
    
            let result = await db.query('DELETE FROM info WHERE id_info = ?', [id]);
            response.ok(result, res);
        } catch (error) {
            console.log(error.message);
        }
    }
}

module.exports = InfoController;