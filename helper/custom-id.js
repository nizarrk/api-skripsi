const db = require('../config/db');
module.exports = async function customID(namatabel, namakolom, prefix, digit){
    let lastCounter = 0;

    let lastId = "";
    let counter = 0;
    let result = await db.query(`SELECT ${namakolom} FROM ${namatabel} WHERE ${namakolom} lIKE '${prefix}%' ORDER BY ${namakolom} DESC limit 1`);
    if (result.length == 0) {
        counter = 1;
    } else{
        result.forEach(row => {
            lastId = row[namakolom];
            let custom = lastId.replace(prefix, "");
            lastCounter = parseInt(custom);
        });
    }

    counter = lastCounter +1;

    let filteredNumber = counter.toString().padStart(digit, '0');

    let newId = prefix + filteredNumber

    return newId ;
}