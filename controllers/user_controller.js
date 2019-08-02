const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
const sharp = require('sharp');
const response = require('../config/res');
const db = require('../config/db');
const key = require('../config/key');

class UserController {
    constructor() {
        this.nama = null;
        this.alamat = null;
        this.tgl = null;
        this.telp = null;
        this.fotoUser = null;
        this.email = null;
        this.pass = null;
    }

    async register(req, res) {
        try {
            let path = '';
            if (req.file == undefined) {
                path = "/uploads/user/defaultuser.jpg";
            } else {
                path = req.file.path.replace(/\\/g, "/");
            }
    
            let resize = await sharp('./' + path).withMetadata().toBuffer();
            await sharp(resize).withMetadata().resize(1080).toFile('./' + path);
            
            this.nama = req.body.nama;
            this.alamat = req.body.alamat;
            this.tgl = req.body.tgl;
            this.telp = req.body.telp;
            this.fotoUser = path;
            this.email = req.body.email;
            this.pass = req.body.pass;
    
            console.log(path);
            
    
            let result = await db.query('SELECT email_user FROM user where email_user = ?', [ this.email ]);
            if (result.length > 0) {
                response.fail("email sudah terdaftar", res);
            } else {
                let hashedPassword = await bcrypt.hash(this.pass, 10);
                await db.query('INSERT INTO user (nama_user, alamat_user, tgl_lahir_user, telp_user, foto_user, email_user, pass_user) values (?,?,?,?,?,?,?)',
                [ this.nama, this.alamat, this.tgl, this.telp, this.fotoUser, this.email, hashedPassword  ]);
                response.ok("Berhasil menambahkan user!", res);
            }
        } catch (error) {
            console.log(error);
            res.status(500).json({message: error.message});
            
        }
    }
    
    async login(req, res) {
        try {
            this.email = req.body.email;
            this.pass = req.body.pass;
            
            let result = await db.query('SELECT * FROM user where email_user = ?', [ this.email ]);
            let hashedPassword = result[0].pass_user;
            
            const match = await bcrypt.compare(this.pass, hashedPassword);
            
            if (match) {
                let token = jwt.sign({userId:result[0].id_user, admin:result[0].is_admin},key.tokenKey, {
                    expiresIn: "1d" 
                });
                res.status(200).json({
                    userId:result[0].id_user,
                    email:result[0].email_user,
                    name:result[0].nama_user,
                    admin: result[0].is_admin,
                    token
                });
            } else {
                res.status(400).json({message:'Invalid Password/Username'});
            }
            
        } catch (error) {
            res.status(500).json({message: error.message});
        }
    }
    
    async getAllUser(req, res) {
        try {
            let result = await db.query('SELECT * FROM user');
            response.ok(result, res);
        } catch (error) {
            console.log(error.message);
        }
    }
    
    async profile(req, res) {
        try {
            let id = req.user.userId;
            let query = `SELECT user.id_user, user.nama_user, user.alamat_user, user.tgl_lahir_user,
                        user.telp_user, user.foto_user, user.email_user,
                        (SELECT COUNT(lapor.status_lapor) FROM lapor WHERE lapor.id_user_lapor = ?) AS total_lapor, 
                        (SELECT COUNT(izin.status_izin) FROM izin WHERE izin.id_user_izin = ?) AS total_izin,
                        (SELECT COUNT(lapor.status_lapor) FROM lapor WHERE lapor.status_lapor = "Menunggu" 
                        AND lapor.id_user_lapor = ?) AS menunggu, (SELECT COUNT(lapor.status_lapor) FROM lapor WHERE lapor.status_lapor = "Ditolak" 
                        AND lapor.id_user_lapor = ?) AS ditolak, (SELECT COUNT(lapor.status_lapor) FROM lapor 
                        WHERE lapor.status_lapor = "Proses" AND lapor.id_user_lapor = ?) AS proses, 
                        (SELECT COUNT(lapor.status_lapor) FROM lapor WHERE lapor.status_lapor = "Selesai" 
                        AND lapor.id_user_lapor = ?) AS selesai, (SELECT COUNT(survey.id_user_survey) 
                        FROM survey WHERE survey.id_user_survey = ? AND YEAR(tgl_survey) = YEAR(CURDATE())) AS total_survey FROM user WHERE user.id_user = ? GROUP BY user.id_user`
            let result = await db.query(query, [ id, id, id, id, id, id, id, id ]);
            response.ok(result, res);
            
        } catch (error) {
            console.log(error.message);
        }
    }
    
    async addUser(req, res) {
        try {
            let nama = req.body.nama;
            let alamat = req.body.alamat;
            let tgl = req.body.tgl;
            let telp = req.body.telp;
            let foto = req.body.foto;
            let email = req.body.email;
            let pass = req.body.pass;
    
            await db.query('INSERT INTO user (nama_user, alamat_user, tgl_lahir_user, telp_user, foto_user, email_user, pass_user) values (?,?,?,?,?,?,?)',
            [ nama, alamat, tgl, telp, foto, email, pass  ] );
            response.ok("Berhasil menambahkan user!", res);
    
        } catch (error) {
            console.log(error.message);
            
        }
    }
    
    async editPass(req, res) {
        try {
            let check = `SELECT user.pass_user FROM user WHERE user.id_user = ?`;
            let oldpass = await db.query(check, [req.user.userId]);
            if (oldpass.length > 0) {
                let match = await bcrypt.compare(req.body.pass, oldpass[0].pass_user);
                if (match) {
                    let hashedPassword = await bcrypt.hash(req.body.newpass, 10);
                    let query = `UPDATE user SET pass_user = ? WHERE id_user = ?`;
                    await db.query(query, [hashedPassword, req.user.userId]);
                    response.ok("Berhasil merubah password user!", res); 
                } else {
                    response.fail("Password lama tidak sesuai", res);
                }
            } else {
                response.fail("User tidak ditemukan!", res); 
            }
        } catch (error) {
            
        }
    }
    
    async editProfile(req, res) {
        try {
            let path = '';
            if (req.file == undefined) {
                path = req.body.path;
            } else {
                path = '/' + req.file.path.replace(/\\/g, "/");
            }
    
            let resize = await sharp('./' + path).withMetadata().toBuffer();
            await sharp(resize).withMetadata().resize(1080).toFile('./' + path);
    
            let query = `UPDATE user SET nama_user = ?, alamat_user = ?, tgl_lahir_user = ?, telp_user = ?,
                         foto_user = ?, email_user = ? WHERE id_user = ?`;
    
            let id = req.params.id;
            let nama = req.body.nama;
            let alamat = req.body.alamat;
            let tgl = req.body.tgl;
            let telp = req.body.telp;
            let fotoUser = path;
            let email = req.body.email;
            let oldemail = req.body.oldemail;
    
            let result = await db.query('SELECT email_user FROM user where email_user = ?', [ email ]);
            if (result.length > 0) {
                console.log('result > 0');
                
                if (result[0].email_user == oldemail) {
                    console.log('email pancet');
                    await db.query(query, [ nama, alamat, tgl, telp, fotoUser, email, id  ] );
                    response.ok("Berhasil merubah user!", res);                
                } else {
                    console.log('email ganti tapi wes onok');
                    response.fail("email sudah terdaftar", res);
                }
            } else {
                console.log('result 0');
                await db.query(query, [ nama, alamat, tgl, telp, fotoUser, email, id  ] );
                response.ok("Berhasil merubah user!", res);
                
                // await db.query(query, [ nama, alamat, tgl, telp, fotoUser, email, id  ] );
                // response.ok("Berhasil merubah user!", res);
            }
        } catch (error) {
            console.log(error.message);
    
        }
    }
    
    async deleteUser(req, res) {
        try {
            let user_id = req.params.id;
    
        await db.query('DELETE FROM user WHERE id_user = ?', [ user_id ] );
        response.ok("Berhasil menghapus user!", res);
        } catch (error) {
            console.log(error.message);
            
        }
    }
}

module.exports = UserController;