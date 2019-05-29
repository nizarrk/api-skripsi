const multer = require('multer');
const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        if (file.fieldname === 'fotoInfo') {
            cb(null, './uploads/info/');
        } else if (file.fieldname === 'fotoUser') {
            cb(null, './uploads/user/');
        } else if (file.fieldname === 'fotoLapor') {
            cb(null, './uploads/lapor/');
        } else if (file.fieldname === 'fotoSurat') {
            cb(null, './uploads/izin/');
        } else if (file.fieldname === 'fotoKTP') {
            cb(null, './uploads/izin/');
        }
    },
    filename: (req, file, cb) => {
        if (file.mimetype === 'image/jpeg') {
            cb(null, new Date().toISOString().replace(/:|\./g,'') + '.jpeg');
        } else if (file.mimetype === 'image/png') {
            cb(null, new Date().toISOString().replace(/:|\./g,'') + '.png');
        }
        
    }
});
const fileFilter = (req, file, cb) => {
    if (file.mimetype === 'image/jpeg' || file.mimetype === 'image/png') {
        cb(null, true);
    } else {
        cb(new Error('file tidak didukung!'), false);
    }
}
const upload = multer({
    storage: storage,
    limits: {
        fileSize: 1024 * 1024 * 10
    },
    fileFilter: fileFilter
});

module.exports = upload;