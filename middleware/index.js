var express = require('express');
var auth = require('./auth');
const verification = require('./verification');
var route = express.Router();

route.post('/api/v1/register', auth.register);
route.post('/api/v1/login', auth.login);

//routes for authorized user (TEST PAGE FOR ADMIN*)
route.get('/api/v1/admin', verification(), auth.admin);

module.exports = route;