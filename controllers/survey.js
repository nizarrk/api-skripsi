const express = require('express');
const router = express.Router();
const bodyParser = require('body-parser');
const response = require('../config/res');
const db = require('../config/db');
const verifyToken = require('../helper/verify-token');

router.use(bodyParser.urlencoded({ limit: "50mb", extended: true, parameterLimit: 50000 }));
router.use(bodyParser.json({ limit: "50mb" }));

router.get('/list', async (req, res) => {
    try {
        let query = `SELECT 
                        id_pertanyaan_survey,pertanyaan_survey,
                        MAX( if( kode_jawaban = 'A', id_jawaban_survey, 0 ) ) AS id_jawaban1, 
                        MAX( if( kode_jawaban = 'A', jawaban_survey, 0 ) ) AS jawaban1,
                        MAX( if( kode_jawaban = 'B', id_jawaban_survey, 0 ) ) AS id_jawaban2,
                        MAX( if( kode_jawaban = 'B', jawaban_survey, 0 ) ) AS jawaban2, 
                        MAX( if( kode_jawaban = 'C', id_jawaban_survey, 0 ) ) AS id_jawaban3,
                        MAX( if( kode_jawaban = 'C', jawaban_survey, 0 ) ) AS jawaban3, 
                        MAX( if( kode_jawaban = 'D', id_jawaban_survey, 0 ) ) AS id_jawaban4,
                        MAX( if( kode_jawaban = 'D', jawaban_survey, 0 ) ) AS jawaban4 
                    FROM ( 
                        SELECT a.id_pertanyaan_survey, a.pertanyaan_survey, b.id_jawaban_survey, b.jawaban_survey, b.kode_jawaban
                        FROM pertanyaan_survey a 
                        INNER JOIN jawaban_survey b ON a.id_pertanyaan_survey = b.id_pertanyaan_survey_jawaban
                        ) a
                    GROUP BY 
                        a.id_pertanyaan_survey`;
        let result = await db.query(query);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
        res.status(500).json({message: error.message});
    }
});

router.post('/submit', verifyToken, async (req, res) => {
    try {
        let query = `INSERT INTO survey (id_user_survey, id_pertanyaan_survey, id_jawaban_survey, tgl_survey)
                     VALUES (?,?,?,?)`;
        let result = await db.query(query, [req.user.userId, req.body.soal, req.body.jwb, new Date()]);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
        res.status(500).json({message: error.message});
    }
});

router.get('/list/:id', async (req, res) => {
    try {
        let query = `SELECT 
                        id_pertanyaan_survey,pertanyaan_survey,
                        MAX( if( kode_jawaban = 'A', id_jawaban_survey, 0 ) ) AS id_jawaban1, 
                        MAX( if( kode_jawaban = 'A', jawaban_survey, 0 ) ) AS jawaban1,
                        MAX( if( kode_jawaban = 'B', id_jawaban_survey, 0 ) ) AS id_jawaban2,
                        MAX( if( kode_jawaban = 'B', jawaban_survey, 0 ) ) AS jawaban2, 
                        MAX( if( kode_jawaban = 'C', id_jawaban_survey, 0 ) ) AS id_jawaban3,
                        MAX( if( kode_jawaban = 'C', jawaban_survey, 0 ) ) AS jawaban3, 
                        MAX( if( kode_jawaban = 'D', id_jawaban_survey, 0 ) ) AS id_jawaban4,
                        MAX( if( kode_jawaban = 'D', jawaban_survey, 0 ) ) AS jawaban4 
                    FROM ( 
                        SELECT a.id_pertanyaan_survey, a.pertanyaan_survey, b.id_jawaban_survey, b.jawaban_survey, b.kode_jawaban
                        FROM pertanyaan_survey a 
                        INNER JOIN jawaban_survey b ON a.id_pertanyaan_survey = b.id_pertanyaan_survey_jawaban
                        ) a
                    WHERE
                        a.id_pertanyaan_survey = ?
                    GROUP BY 
                        a.id_pertanyaan_survey`;
        let result = await db.query(query, [req.params.id]);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
        
    }
});

router.put('/list', async (req, res) => {
    try {
        db.getConnection((err, conn) => {
            if (err) { throw err; }
            conn.beginTransaction(async (err) => {
                if (err) { throw err; }
                await db.query(`UPDATE pertanyaan_survey SET pertanyaan_survey = ? WHERE id_pertanyaan_survey = ?`, 
                [req.body.pertanyaan, req.body.id]);
                await db.query(`UPDATE jawaban_survey SET jawaban_survey = ? WHERE id_jawaban_survey = ?`, 
                [req.body.jwb1, req.body.idjwb1]);
                await db.query(`UPDATE jawaban_survey SET jawaban_survey = ? WHERE id_jawaban_survey = ?`, 
                [req.body.jwb2, req.body.idjwb2]);
                await db.query(`UPDATE jawaban_survey SET jawaban_survey = ? WHERE id_jawaban_survey = ?`, 
                [req.body.jwb3, req.body.idjwb3]);
                await db.query(`UPDATE jawaban_survey SET jawaban_survey = ? WHERE id_jawaban_survey = ?`, 
                [req.body.jwb4, req.body.idjwb4]);

            });
            conn.commit(err => {
                if (err) {
                    return conn.rollback(() => {
                        throw err;
                    });
                }
                response.ok(`Berhasil mengubah pertanyaan ${req.params.id}`, res);
            });
        });
    } catch (error) {
        console.log(error.message);
        
    }
});

router.delete('/list', async (req, res) => {
    try {
        db.getConnection((err, conn) => {
            if (err) { throw err; }
            conn.beginTransaction(async (err) => {
                if (err) { throw err; }
                await db.query(`DELETE FROM jawaban_survey `);
                await db.query(`DELETE FROM pertanyaan_survey`);

            });
            conn.commit(err => {
                if (err) {
                    return conn.rollback(() => {
                        throw err;
                    });
                }
                response.ok(`Berhasil menghapus pertanyaan ${req.params.id}`, res);
            });
        });
    } catch (error) {
        console.log(error.message);
        
    }
});

router.get('/', async (req, res) => {
    try {
        let query = `SELECT 
                        id_pertanyaan,pertanyaan,
                        MAX( if( kode_jawaban = 'A', id_jawaban, 0 ) ) AS id_jawaban1, 
                        MAX( if( kode_jawaban = 'A', jawaban, 0 ) ) AS jawaban1,
                        MAX( if( kode_jawaban = 'B', id_jawaban, 0 ) ) AS id_jawaban2,
                        MAX( if( kode_jawaban = 'B', jawaban, 0 ) ) AS jawaban2, 
                        MAX( if( kode_jawaban = 'C', id_jawaban, 0 ) ) AS id_jawaban3,
                        MAX( if( kode_jawaban = 'C', jawaban, 0 ) ) AS jawaban3, 
                        MAX( if( kode_jawaban = 'D', id_jawaban, 0 ) ) AS id_jawaban4,
                        MAX( if( kode_jawaban = 'D', jawaban, 0 ) ) AS jawaban4 
                    FROM ( 
                        SELECT a.id_pertanyaan, a.pertanyaan, b.id_jawaban, b.jawaban, b.kode_jawaban
                        FROM pertanyaan a 
                        INNER JOIN jawaban b ON a.id_pertanyaan = b.id_pertanyaan_jawaban
                        ) a
                    GROUP BY 
                        a.id_pertanyaan`;
        let result = await db.query(query);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
        
    }
});

router.get('/:id', async (req, res) => {
    try {
        let query = `SELECT 
                        id_pertanyaan,pertanyaan,
                        MAX( if( kode_jawaban = 'A', id_jawaban, 0 ) ) AS id_jawaban1, 
                        MAX( if( kode_jawaban = 'A', jawaban, 0 ) ) AS jawaban1,
                        MAX( if( kode_jawaban = 'B', id_jawaban, 0 ) ) AS id_jawaban2,
                        MAX( if( kode_jawaban = 'B', jawaban, 0 ) ) AS jawaban2, 
                        MAX( if( kode_jawaban = 'C', id_jawaban, 0 ) ) AS id_jawaban3,
                        MAX( if( kode_jawaban = 'C', jawaban, 0 ) ) AS jawaban3, 
                        MAX( if( kode_jawaban = 'D', id_jawaban, 0 ) ) AS id_jawaban4,
                        MAX( if( kode_jawaban = 'D', jawaban, 0 ) ) AS jawaban4 
                    FROM ( 
                        SELECT a.id_pertanyaan, a.pertanyaan, b.id_jawaban, b.jawaban, b.kode_jawaban
                        FROM pertanyaan a 
                        INNER JOIN jawaban b ON a.id_pertanyaan = b.id_pertanyaan_jawaban
                        ) a
                    WHERE
                        a.id_pertanyaan = ?
                    GROUP BY 
                        a.id_pertanyaan`;
        let result = await db.query(query, [req.params.id]);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
        
    }
});

router.post('/', async (req, res) => {
    try {        
        let result = await db.query('INSERT INTO pertanyaan (pertanyaan) VALUES (?)', [req.body.pertanyaan]);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
        
    }
});

router.put('/:id', async (req, res) => {
    try {
        let result = await db.query('UPDATE pertanyaan SET pertanyaan.pertanyaan = ? WHERE pertanyaan.id_pertanyaan = ?', 
        [req.body.params]);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
        
    }
})

router.post('/jawaban', async (req, res) => {
    try {
        let result = await db.query('INSERT INTO jawaban (id_pertanyaan_jawaban, jawaban, kode_jawaban) VALUES (?,?,?)', [req.body.id, req.body.jawaban, req.body.kode]);
        response.ok(result, res);
    } catch (error) {
        console.log(error.message);
        
    }
});

router.post('/addall', async (req, res) => {
    try {
        db.getConnection((err, conn) => {
            if (err) { throw err; }
            conn.beginTransaction(async (err) => {
                if (err) { throw err; }
                let pertanyaan = await db.query(`INSERT INTO pertanyaan_survey (pertanyaan_survey.id_pertanyaan_survey, pertanyaan_survey.pertanyaan_survey)
                                                SELECT * FROM pertanyaan WHERE NOT EXISTS (SELECT pertanyaan_survey.id_pertanyaan_survey
                                                FROM pertanyaan_survey WHERE pertanyaan_survey.id_pertanyaan_survey = pertanyaan.id_pertanyaan)`);
                await db.query(`INSERT INTO jawaban_survey (jawaban_survey.id_jawaban_survey, jawaban_survey.id_pertanyaan_survey_jawaban, jawaban_survey.jawaban_survey, jawaban_survey.kode_jawaban)
                                SELECT * FROM jawaban WHERE NOT EXISTS (SELECT jawaban_survey.id_jawaban_survey 
                                FROM jawaban_survey WHERE jawaban_survey.id_jawaban_survey = jawaban.id_jawaban)`);
                response.ok(pertanyaan, res);
            });
            conn.commit(err => {
                if (err) {
                    return conn.rollback(() => {
                        throw err;
                    });
                }
            });
        });
    } catch (error) {
        console.log(error.message);
        
    }
});

router.post('/addsurvey', async (req, res) => {
    try {
        db.getConnection((err, conn) => {
            if (err) { throw err; }
            conn.beginTransaction(async (err) => {
                if (err) { throw err; }
                let pertanyaan = await db.query(`INSERT INTO pertanyaan_survey (pertanyaan_survey.id_pertanyaan_survey, pertanyaan_survey.pertanyaan_survey)
                                                SELECT * FROM pertanyaan WHERE pertanyaan.id_pertanyaan = ? AND NOT EXISTS (SELECT pertanyaan_survey.id_pertanyaan_survey
                                                FROM pertanyaan_survey WHERE pertanyaan_survey.id_pertanyaan_survey = pertanyaan.id_pertanyaan)`,
                                                [req.body.id]);
                await db.query(`INSERT INTO jawaban_survey (jawaban_survey.id_jawaban_survey, jawaban_survey.id_pertanyaan_survey_jawaban, jawaban_survey.jawaban_survey, jawaban_survey.kode_jawaban)
                                SELECT * FROM jawaban WHERE jawaban.id_pertanyaan_jawaban = ? AND NOT EXISTS (SELECT jawaban_survey.id_jawaban_survey 
                                FROM jawaban_survey WHERE jawaban_survey.id_jawaban_survey = jawaban.id_jawaban)`, 
                                [req.body.id]);
                response.ok(pertanyaan, res);
            });
            conn.commit(err => {
                if (err) {
                    return conn.rollback(() => {
                        throw err;
                    });
                }
            });
        });
    } catch (error) {
        console.log(error.message);
        
    }
});

router.put('/', async (req, res) => {
    try {
        db.getConnection((err, conn) => {
            if (err) { throw err; }
            conn.beginTransaction(async (err) => {
                if (err) { throw err; }
                await db.query(`UPDATE pertanyaan SET pertanyaan = ? WHERE id_pertanyaan = ?`, 
                [req.body.pertanyaan, req.body.id]);
                await db.query(`UPDATE jawaban SET jawaban = ? WHERE id_jawaban = ?`, 
                [req.body.jwb1, req.body.idjwb1]);
                await db.query(`UPDATE jawaban SET jawaban = ? WHERE id_jawaban = ?`, 
                [req.body.jwb2, req.body.idjwb2]);
                await db.query(`UPDATE jawaban SET jawaban = ? WHERE id_jawaban = ?`, 
                [req.body.jwb3, req.body.idjwb3]);
                await db.query(`UPDATE jawaban SET jawaban = ? WHERE id_jawaban = ?`, 
                [req.body.jwb4, req.body.idjwb4]);

            });
            conn.commit(err => {
                if (err) {
                    return conn.rollback(() => {
                        throw err;
                    });
                }
                response.ok(`Berhasil mengubah pertanyaan ${req.params.id}`, res);
            });
        });
    } catch (error) {
        console.log(error.message);
        
    }
});

router.delete('/:id', async (req, res) => {
    try {
        db.getConnection((err, conn) => {
            if (err) { throw err; }
            conn.beginTransaction(async (err) => {
                if (err) { throw err; }
                await db.query(`DELETE FROM jawaban WHERE id_pertanyaan_jawaban = ?`, [req.params.id]);
                await db.query(`DELETE FROM pertanyaan WHERE id_pertanyaan = ?`, [req.params.id]);

            });
            conn.commit(err => {
                if (err) {
                    return conn.rollback(() => {
                        throw err;
                    });
                }
                response.ok(`Berhasil menghapus pertanyaan ${req.params.id}`, res);
            });
        });
    } catch (error) {
        console.log(error.message);
        
    }
});

router.delete('/list/:id', async (req, res) => {
    try {
        db.getConnection((err, conn) => {
            if (err) { throw err; }
            conn.beginTransaction(async (err) => {
                if (err) { throw err; }
                await db.query(`DELETE FROM jawaban_survey WHERE id_pertanyaan_survey_jawaban = ?`, [req.params.id]);
                await db.query(`DELETE FROM pertanyaan_survey WHERE id_pertanyaan_survey = ?`, [req.params.id]);

            });
            conn.commit(err => {
                if (err) {
                    return conn.rollback(() => {
                        throw err;
                    });
                }
                response.ok(`Berhasil menghapus pertanyaan ${req.params.id}`, res);
            });
        });
    } catch (error) {
        console.log(error.message);
        
    }
});

module.exports = router;