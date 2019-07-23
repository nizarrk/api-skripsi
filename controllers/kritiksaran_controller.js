const response = require('../config/res');
const db = require('../config/db');

class KritikSaranController {
    constructor() {
        this.user = null;
        this.rate = null;
        this.desk = null;
        this.tgl = null;
    }

    async lihatKritikSaran(req, res) {
        try {
            let query = `SELECT kritiksaran.id_kritiksaran, kritiksaran.rate_kritiksaran, kritiksaran.desk_kritiksaran,
                        kritiksaran.tgl_kritiksaran, user.id_user, user.nama_user FROM kritiksaran INNER JOIN user
                        ON kritiksaran.id_user_kritiksaran = user.id_user ORDER BY id_kritiksaran DESC`;
            let result = await db.query(query);
            response.ok(result, res);
        } catch (error) {
            console.log(error.message);
        }
    }
    
    async getKritikSaranById(req, res) {
        try {
            let id = req.body.id;
    
            let result = await db.query('SELECT * FROM info WHERE id_kritiksaran = ?', [id]);
            response.ok(result, res);
        } catch (error) {
            console.log(error.message);
        }
    }
    
    async tambahKritikSaran(req, res) {
        try {        
            this.user = req.user.userId;
            this.rate = req.body.rate;
            this.desk = req.body.desk;
            this.tgl = new Date();            
    
            let result = await db.query('INSERT INTO kritiksaran (id_user_kritiksaran, rate_kritiksaran, desk_kritiksaran, tgl_kritiksaran) values (?,?,?,?)', 
            [this.user, this.rate, this.desk, this.tgl]);
            response.ok(result, res);
        } catch (error) {
            console.log(error.message);
        }
    }
}

module.exports = KritikSaranController;