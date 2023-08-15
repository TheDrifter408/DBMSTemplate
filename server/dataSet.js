const db = require('./connection');

//Statement for number of male and female per division
let sql_acc_per_div = `SELECT
branch,
SUM(CASE WHEN gender = 'male' THEN 1 ELSE 0 END) AS male_count,
SUM(CASE WHEN gender = 'female' THEN 1 ELSE 0 END) AS female_count
FROM
lankabangla.client
GROUP BY
branch;`
let data = new Array();
const getResults = () => {
    return new Promise((resolve, reject) => {
        db.query(sql_acc_per_div, (err, results) => {
            if (err) {
                reject(err);
            } else {
                resolve(results);
            }
        });
    });
};

// Using the Promise to handle the asynchronous operation
getResults()
    .then((results) => {
        console.log("Query results:", results);
    })
    .catch((err) => {
        console.error("Error:", err);
});




(async () => {
    try {
        const data = await getResults();
        console.log('Query results: ',data);
    } catch(err) {
        console.error("Error: ",error);
    }
}) 

module.exports = data;