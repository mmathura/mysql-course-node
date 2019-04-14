// console.log('This is some code!');

// for (var i = 0; i < 5; i++) {
//     console.log("Hello world! " + (i + 1));
//     // insert users in database
// }

// console.log(5 + 5);

// var faker = require('faker');

// function genAddr() {
//     console.log(faker.address.streetAddress());
//     console.log(faker.address.city());
//     console.log(faker.address.state());
// }

// genAddr();

// console.log(faker.internet.email());
// console.log(faker.date.past());

// var mysql = require('mysql');
// var faker = require('faker');

// var connection = mysql.createConnection({
//   host     : 'localhost',
//   user     : 'mmathura',  //your root username (leave as root)
//   database : 'join_us',   //the name of your db (create this if you haven't already)
//   // password : process.env.MYSQL_PW   //your root user's password
// });

// SELECT 1 + 1; 

// connection.query('SELECT 1 + 1 AS solution', function (error, results, fields) {
//   if (error) throw error;
//   console.log('The solution is: ', results[0].solution);
// });

// SELECT CURTIME() as time, CURDATE() as date, NOW() as now;

// var q = 'SELECT CURTIME() as time, CURDATE() as date, NOW() as now';
// connection.query(q, function (error, results, fields) {
//   if (error) throw error;
//   console.log(results[0].time);
//   console.log(results[0].date);
//   console.log(results[0].now);
// });

// export MYSQL_PW='your-password-here'
// use dotenv package 

// var q = 'SELECT * FROM users ';
// connection.query(q, function (error, results, fields) {
//   if (error) throw error;
//   console.log(results);
// });

// var q = 'SELECT COUNT(*) AS total FROM users ';
// connection.query(q, function (error, results, fields) {
//   if (error) throw error;
//   console.log(results[0].total);
// });

// var q = 'INSERT INTO users (email) VALUES ("rusty_the_dog@gmail.com")';
 
// connection.query(q, function (error, results, fields) {
//   if (error) throw error;
//   console.log(results);
// });

// var person = {
//     email: faker.internet.email(),
//     created_at: faker.date.past()
// };
 
// var end_result = connection.query('INSERT INTO users SET ?', person, function(err, result) {
//   if (err) throw err;
//   console.log(result);
// });

// console.log(end_result.sql);

// connection.end();

var mysql = require('mysql');
var faker = require('faker');
 
 
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'mmathura',
  database : 'join_us'
});
 
 
var data = [];
for(var i = 0; i < 500; i++){
    data.push([
        faker.internet.email(),
        faker.date.past()
    ]);
}
 
 
var q = 'INSERT INTO users (email, created_at) VALUES ?';
 
connection.query(q, [data], function(err, result) {
  console.log(err);
  console.log(result);
});
 
connection.end();






