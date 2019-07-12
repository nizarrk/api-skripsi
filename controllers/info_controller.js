const sharp = require('sharp');
const response = require('../config/res');
const db = require('../config/db');

exports.getInfoTrayek = async (req, res) => {
    try {
        let result = await db.query('SELECT * FROM trayek ORDER BY id_trayek DESC');
        response.ok(result, res);        
    } catch (error) {
        console.log(error.message);
        
    }
}

exports.getInfo = async (req, res) => {
    try {
        let result = await db.query('SELECT * FROM info ORDER BY id_info DESC');
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
    }
}

exports.getInfoById = async (req, res) => {
    try {
        let result = await db.query('SELECT * FROM info WHERE id_info = ?', 
        [req.params.id]);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
    }
}

exports.getTrayekById = async (req, res) => {
    try {
        let query = `SELECT * FROM trayek WHERE id_trayek = ?`;
        let id = req.params.id;
        let result =await db.query(query, [id]);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
        
    }
}

exports.addTrayek = async (req, res) => {
    try {
        let nama = req.body.nama;
        let rute = req.body.rute;
        let latlng = JSON.stringify(req.body.latlng);
        let jarak = req.body.jarak;
        let status = 'Aktif';

        let result = await db.query('INSERT INTO trayek (nama_trayek, rute_trayek, latlng_trayek, jarak_trayek, status_trayek) VALUES (?,?,?,?,?)',
        [nama, rute, latlng, jarak, status]);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
        
    }
}

exports.editTrayek = async (req, res) => {
    try {
        console.log(req.body);
        let id = req.body.id;
        let nama = req.body.nama;
        let rute = req.body.rute;
        let latlng = JSON.stringify(req.body.latlng);
        let jarak = req.body.jarak;
        let status = 'Aktif';
        
        let result = await db.query('UPDATE trayek SET nama_trayek = ?, rute_trayek = ?, latlng_trayek = ?, jarak_trayek = ?, status_trayek = ? WHERE id_trayek = ?',
        [nama, rute, latlng, jarak, status, id]);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
        
    }
}

exports.deleteTrayek = async (req, res) => {
    try {
        let id = req.params.id;

        let result = await db.query('DELETE FROM trayek WHERE id_trayek = ?', [id]);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
    }
}

exports.addInfo = async (req, res) => {
    try {
        let path = req.file.path.replace(/\\/g, "/");

        let resize = await sharp('./' + path).withMetadata().toBuffer();
        await sharp(resize).withMetadata().resize(1080).toFile('./' + path);
        
        let judul = req.body.judul;
        let fotoInfo = '/' + path;
        let desk = req.body.desk;
        let kat = req.body.kat;
        let tgl = new Date();
        let author = req.body.author;

        let result = await db.query('INSERT INTO info (judul_info, foto_info, desk_info, kat_info, tgl_info, author_info) VALUES (?,?,?,?,?,?)', 
        [judul, fotoInfo, desk, kat, tgl, author]);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
    }
}

exports.editInfo = async (req, res) => {
    try {
        let id = req.body.id;
        let judul = req.body.judul;
        let desk = req.body.desk;
        let kat = req.body.kat;
        let author = req.body.author;
        if (req.file == undefined) {
            let result = await db.query('UPDATE info SET judul_info = ?, desk_info = ?, kat_info = ?, author_info = ? WHERE id_info = ?', 
            [judul, desk, kat, author, id]);
            response.ok(result, res);
        } else {
            let path = req.file.path.replace(/\\/g, "/");

            let resize = await sharp('./' + path).withMetadata().toBuffer();
            await sharp(resize).withMetadata().resize(1080).toFile('./' + path);

            let id = req.body.id;
            let judul = req.body.judul;
            let fotoInfo = '/' + path;
            let desk = req.body.desk;
            let kat = req.body.kat;
            let author = req.body.author;
            
            let result = await db.query('UPDATE info SET judul_info = ?, foto_info = ?, desk_info = ?, kat_info = ?, author_info = ? WHERE id_info = ?', 
            [judul, fotoInfo, desk, kat, tgl, author, id]);
            response.ok(result, res);
        }
    } catch (error) {
        console.log(error.message);
        res.status(500).json({message: error.message});
    }
}

exports.deleteInfo = async (req, res) => {
    try {
        let id = req.params.id;

        let result = await db.query('DELETE FROM info WHERE id_info = ?', [id]);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
    }
}