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
        //var fullUrl = req.protocol + '://' + req.get('host') + req.originalUrl;
        let fullUrl = req.protocol + '://' + req.get('host') + '/';
        let path = req.file.path.replace(/\\/g, "/");

        let resize = await sharp('./' + path).withMetadata().toBuffer();
        await sharp(resize).withMetadata().resize(1080).toFile('./' + path);
        
        let nama = req.body.nama;
        let alamat = req.body.alamat;
        let tgl = req.body.tgl;
        let telp = req.body.telp;
        let fotoUser = fullUrl + path;
        let email = req.body.email;
        let pass = req.body.pass;

        console.log(fotoUser);
        

        let result = await db.query('SELECT * FROM user where email_user = ?', [ email ]);
        if (result.length > 0) {
            response.ok("email sudah terdaftar", res);
        } else {
            let hashedPassword = await bcrypt.hash(pass, 10);
            await db.query('INSERT INTO user (nama_user, alamat_user, tgl_lahir_user, telp_user, foto_user, email_user, pass_user) values (?,?,?,?,?,?,?)',
            [ nama, alamat, tgl, telp, fotoUser, email, hashedPassword  ]);
            response.ok("Berhasil menambahkan user!", res);
        }
    } catch (error) {
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
        let result = await db.query('SELECT user.id_user, user.nama_user, user.alamat_user, user.tgl_lahir_user, user.telp_user, user.foto_user, user.email_user, user.pass_user, (SELECT COUNT(lapor.status_lapor) FROM lapor WHERE lapor.id_user_lapor = ?) AS total_lapor, (SELECT COUNT(lapor.status_lapor) FROM lapor WHERE lapor.status_lapor = "Menunggu" AND lapor.id_user_lapor = ?) AS menunggu, (SELECT COUNT(lapor.status_lapor) FROM lapor WHERE lapor.status_lapor = "Proses" AND lapor.id_user_lapor = ?) AS proses, (SELECT COUNT(lapor.status_lapor) FROM lapor WHERE lapor.status_lapor = "Selesai" AND lapor.id_user_lapor = ?) AS selesai FROM user INNER JOIN lapor ON user.id_user = lapor.id_user_lapor AND user.id_user = ? GROUP BY user.id_user', 
        [ req.user.userId, req.user.userId, req.user.userId, req.user.userId, req.user.userId ]);
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

router.put('/', async (req, res) => {
    try {
        let id = req.body.id;
        let nama = req.body.nama;
        let alamat = req.body.alamat;
        let tgl = req.body.tgl;
        let telp = req.body.telp;
        let foto = req.body.foto;
        let email = req.body.email;
        let pass = req.body.pass;

        await db.query('UPDATE user SET nama_user = ?, alamat_user = ?, tgl_lahir_user = ?, telp_user = ?, foto_user = ?, email_user = ?, pass_user = ? WHERE id_user = ?',
        [ nama, alamat, tgl, telp, foto, email, pass, id  ] );
        response.ok("Berhasil merubah user!", res)
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