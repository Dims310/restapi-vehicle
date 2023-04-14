'use strict';

var response = require('./res');
var connection = require('./connection');

exports.index = function(req, res){
    response.ok("REST API Vehicle", res)
}

// get all vehicles data
exports.getAllUser = function(req, res){
    connection.query("SELECT * FROM users", (err, rows, fields) => {
        if (err) throw err;
        response.ok(rows, res)
    });
}