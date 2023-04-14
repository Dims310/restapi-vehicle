'use strict';

var response = require('./res');
var connection = require('./connection');

exports.index = function(req, res){
    response.ok("REST API Vehicle", res)
}

// get all vehicles data
// output: {status, values: {id, name, created_at, updated_at}}
exports.getAllUser = function(req, res){
    connection.query("SELECT * FROM users", (err, rows, fields) => {
        if (err) throw err;
        response.ok(rows, res)
    });
}

// add vehicles data
// output: {status, values}
exports.postVehicles = function(req, res){
    var name = req.body.name;
    connection.query("INSERT INTO vehicle_brand (name) VALUES (?)", [name],
    function(err, rows, fields){
        if (err) throw err;
        response.ok("Success create brand vehicle", res);
    });
}