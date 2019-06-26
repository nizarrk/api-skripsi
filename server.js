const express = require('express');
const app = express();
const cors = require('cors');
const port = process.env.PORT || 3000;
const bodyParser = require('body-parser');
const response = require('./config/res');
const user = require('./controllers/user');
const info = require('./controllers/info');
const kritik = require('./controllers/kritiksaran');
const lapor = require('./controllers/lapor');
const komentar = require('./controllers/komentar');
const izin = require('./controllers/izin');
const notifikasi = require('./controllers/notifikasi');
const survey = require('./controllers/survey');


app.use(cors());

// app.use(function(req, res, next) {
//     res.header("Access-Control-Allow-Origin", "*");
//     res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
//     next();
//   });

// define routes
app.use('/user', user);
app.use('/info', info);
app.use('/kritik', kritik);
app.use('/lapor', lapor);
app.use('/komentar', komentar);
app.use('/izin', izin);
app.use('/notif', notifikasi);
app.use('/survey', survey);
app.use('/uploads', express.static('uploads'));

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.get('/', (req, res) => {
    response.ok("Hello from the Node JS RESTful side!", res)
    //console.log(res);
});

// const routes = require('./routes');
// routes(app);

app.listen(port);
console.log('RESTful API server started on: ' + port);