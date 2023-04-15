var express = require('express');
var auth = require('./auth');
var route = express.Router();

route.post('/api/v1/register', auth.register);
route.post('/api/v1/login', auth.login);

module.exports = route;