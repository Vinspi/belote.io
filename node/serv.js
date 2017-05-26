var express = require('express');
var bodyParser = require('body-parser'); // for reading POSTed form data into `req.body`
var expressSession = require('express-session');
var cookieParser = require('cookie-parser'); // the session is stored in a cookie, so we use this to parse it
var path = require('path');
var app = express();

// must use cookieParser before expressSession
app.use(cookieParser());

app.use(expressSession({secret:'somesecrettokenhere'}));

app.use(bodyParser());

app.use(express.static(path.resolve('../')));

app.set('view engine', 'jade');
app.set('views', '../views');

app.use(bodyParser.json()); // support json encoded bodies
app.use(bodyParser.urlencoded({ extended: true })); // support encoded bodies

app.get('/', function (req, res) {
  res.render('index', { title: 'Hey', message: 'Hello hey!'});
});

app.get('/sign_up', function (req, res) {
  res.render('create_account', { title: 'Hey', message: 'Hello hey!'});
});

app.post('/sign_up_verification', function(req,res) {
  var pseudo = req.body.pseudo;
  var email = req.body.email;
  var mdp = req.body.mdp;
  var mdp_verif = req.body.mdp_verif;

  if(mdp != mdp_verif)
    res.render('create_account', {mauvais_mdp: 0, mauvais_email: 0, mauvais_pseudo: 0, mdp_non_corres: 1});
  else if(mdp.length < 6)
    res.render('create_account', {mauvais_mdp: 1, mauvais_email: 0, mauvais_pseudo: 0, mdp_non_corres: 0});



});

app.get('/sign_in', function (req, res) {
  res.render('connect_account', { title: 'Hey', message: 'Hello hey!'});
});



app.listen(8080);
