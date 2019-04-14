var express = require('express');
var mysql = require('mysql');
var bodyParser = require('body-parser');
var app = express();

app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({extended: true}));
app.use(express.static(__dirname + "/public"));


var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'mmathura',
  database : 'join_us'
});

app.get("/", function(req, res) {
    var q = 'SELECT COUNT(*) as count from users';
    connection.query(q, function(err, result) {
        if(err) throw err; 
        // console.log(err);
        // res.send("There are " + result[0].count + " user(s) in the database!");
        var count = result[0].count;
        // console.log(count);
        res.render('home', {data: count});
    });
    console.log('Someone requested us.');
    // res.send('This is from our web app!');
    // console.log(req);
});

app.post('/register', function(req,res) {
    console.log('Using post /register route.');
    var person = {email: req.body.email};
    console.log(req.body.email);
    // console.log(person);
    connection.query('INSERT INTO users SET ?', person, function(err, result) {
        if (err) throw err;
        console.log(err);
        console.log(result);
        res.redirect("/");
    });
});

app.get('/joke', function(req, res){
    var joke = "What do you call a dog that does magic tricks? <em>A labracadabrador</em>";
    res.send(joke);
    console.log("Requestd the joke route.");
});

app.get('/random_num', function(req, res){
    var num = Math.floor((Math.random() * 10) + 1);
    res.send("The random number is " + num);
    console.log("Requestd random number route. Random num is ", num);
});

app.listen(8080, function() {
    console.log('Listening on port: 8080!');
});