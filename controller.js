'use strict';

var response = require('./config/res');
var connection = require('./config/db');

exports.users = function(req, res) {
    connection.query('SELECT * FROM user', function (error, rows, fields){
        if(error){
            console.log(error)
        } else{
            response.ok(rows, res)
            
        }
    });
};

exports.findUsers = function(req, res) {
    
    var user_id = req.params.user_id;

    connection.query('SELECT * FROM user where id = ?',
    [ user_id ], 
    function (error, rows, fields){
        if(error){
            console.log(error)
        } else{
            response.ok(rows, res)
        }
    });
};

exports.createUsers = function(req, res) {
    
    var nama = req.body.nama;
    var alamat = req.body.alamat;
    var tgl = req.body.tgl;
    var telp = req.body.telp;
    var email = req.body.email;
    var pass = req.body.pass;

    connection.query('INSERT INTO user (nama_user, alamat_user, tgl_lahir_user, telp_user, email_user, pass_user) values (?,?,?,?,?,?)',
    [ nama, alamat, tgl, telp, email, pass  ], 
    function (error, rows, fields){
        if(error){
            console.log(error)
        } else{
            response.ok("Berhasil menambahkan user!", res)
        }
    });
};

exports.updateUsers = function(req, res) {
    
    var id = req.body.id;
    var nama = req.body.nama;
    var alamat = req.body.alamat;
    var tgl = req.body.tgl;
    var telp = req.body.telp;
    var email = req.body.email;
    var pass = req.body.pass;

    connection.query('UPDATE user SET nama_user = ?, alamat_user = ?, tgl_lahir_user = ?, telp_user = ?, email_user = ?, pass_user = ? WHERE id_user = ?',
    [ nama, alamat, tgl, telp, email, pass, id  ], 
    function (error, rows, fields){
        if(error){
            console.log(error)
        } else{
            response.ok("Berhasil merubah user!", res)
        }
    });
};

exports.deleteUsers = function(req, res) {
    
    var user_id = req.body.id;

    connection.query('DELETE FROM person WHERE id = ?',
    [ user_id ], 
    function (error, rows, fields){
        if(error){
            console.log(error)
        } else{
            response.ok("Berhasil menghapus user!", res)
        }
    });
};

exports.index = function(req, res) {
    response.ok("Hello from the Node JS RESTful side!", res)
    console.log(res);
    
};