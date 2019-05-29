const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
const sharp = require('sharp');
const upload = require('../helper/upload-image');
const response = require('../config/res');
const db = require('../config/db');
const key = require('../config/key');
const verifyToken = require('../helper/verify-token');

router.use(bodyParser.urlencoded({ extended: true }));
router.use(bodyParser.json());

router.post('/register', upload.single('fotoUser'), async (req, res) => {
    try {
        let path = '';
        if (req.file == undefined) {
            path = "/uploads/user/defaultuser.jpg";
        } else {
            path = req.file.path.replace(/\\/g, "/");
        }
        //var fullUrl = req.protocol + '://' + req.get('host') + req.originalUrl;
        // let fullUrl = req.protocol + '://' + req.get('host') + '/';
        // let path = req.file.path.replace(/\\/g, "/");

        let resize = await sharp('./' + path).withMetadata().toBuffer();
        await sharp(resize).withMetadata().resize(1080).toFile('./' + path);
        
        let nama = req.body.nama;
        let alamat = req.body.alamat;
        let tgl = req.body.tgl;
        let telp = req.body.telp;
        let fotoUser = path;
        let email = req.body.email;
        let pass = req.body.pass;

        console.log(path);
        

        let result = await db.query('SELECT email_user FROM user where email_user = ?', [ email ]);
        if (result.length > 0) {
            response.fail("email sudah terdaftar", res);
        } else {
            let hashedPassword = await bcrypt.hash(pass, 10);
            await db.query('INSERT INTO user (nama_user, alamat_user, tgl_lahir_user, telp_user, foto_user, email_user, pass_user) values (?,?,?,?,?,?,?)',
            [ nama, alamat, tgl, telp, fotoUser, email, hashedPassword  ]);
            response.ok("Berhasil menambahkan user!", res);
        }
    } catch (error) {
        console.log(error);
        res.status(500).json({message: error.message});
        
    }
});

router.post('/login', async (req, res) => {
    try {
        let email = req.body.email;
        let pass = req.body.pass;

        let result = await db.query('SELECT * FROM user where email_user = ?', [ email ]);
        let hashedPassword = result[0].pass_user;
        const match = await bcrypt.compare(pass, hashedPassword);
        
        if (match) {
            let token = jwt.sign({userId:result[0].id_user},key.tokenKey, {
                expiresIn: "1d" 
            });
            res.status(200).json({
                userId:result[0].id_user,
                email:result[0].email_user,
                name:result[0].nama_user,
                token
            });
        } else {
            res.status(400).json({message:'Invalid Password/Username'});
        }
        
    } catch (error) {
        res.status(500).json({message: error.message});
    }
});

router.get('/tes', verifyToken, async (req, res) => {
    try {
        res.send("halo");
        console.log(req.userId);
        
    } catch (error) {
        console.log(error.message);
        
    }    
});

router.get('/', async (req, res) => {
    try {
        let result = await db.query('SELECT * FROM user');
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
    }
});

router.get('/profile', verifyToken, async (req, res) => {
    try {
        let id = req.user.userId;
        let query = `SELECT user.id_user, user.nama_user, user.alamat_user, user.tgl_lahir_user,
                    user.telp_user, user.foto_user, user.email_user,
                    (SELECT COUNT(lapor.status_lapor) FROM lapor WHERE lapor.id_user_lapor = ?) AS total_lapor, 
                    (SELECT COUNT(izin.status_izin) FROM izin WHERE izin.id_user_izin = ?) AS total_izin,
                    (SELECT COUNT(lapor.status_lapor) FROM lapor WHERE lapor.status_lapor = "Menunggu" 
                    AND lapor.id_user_lapor = ?) AS menunggu, (SELECT COUNT(lapor.status_lapor) FROM lapor 
                    WHERE lapor.status_lapor = "Proses" AND lapor.id_user_lapor = ?) AS proses, 
                    (SELECT COUNT(lapor.status_lapor) FROM lapor WHERE lapor.status_lapor = "Selesai" 
                    AND lapor.id_user_lapor = ?) AS selesai FROM user WHERE user.id_user = ? GROUP BY user.id_user`
        let result = await db.query(query, [ id, id, id, id, id, id ]);
        response.ok(result, res);
        
    } catch (error) {
        console.log(error.message);
    }
});

router.post('/', async (req, res) => {
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
});

router.put('/:id', verifyToken, upload.single('fotoUser'), async (req, res) => {
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
});

router.delete('/:id', async (req, res) => {
    try {
        let user_id = req.params.id;

    await db.query('DELETE FROM user WHERE id_user = ?', [ user_id ] );
    response.ok("Berhasil menghapus user!", res);
    } catch (error) {
        console.log(error.message);
        
    }
});

module.exports = router;