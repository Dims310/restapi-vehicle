'use strict';

var response = require('./res');
var connection = require('./connection');

exports.index = function(req, res){
    response.ok("REST API Vehicle", res)
}

// get all users data
// output: {status, values: {id, name, created_at, updated_at}}
exports.getAllUser = function(req, res){
    connection.query("SELECT * FROM users", (err, rows, fields) => {
        if (err) throw err;
        response.ok(rows, res)
    });
}

// get all vehicles data
// output: {status, values: {id, name, created_at, updated_at}}
exports.getAllVehicleBrand = function(req, res){
    connection.query("SELECT * FROM vehicle_brand", (err, rows, fields) => {
        if (err) throw err;
        response.ok(rows, res)
    });
}

// add vehicle brand data *POST
// output: {status, values}
exports.postVehiclesBrand = function(req, res){
    var name = req.body.name;
    connection.query("INSERT INTO vehicle_brand (name) VALUES (?)", [name],
    function(err, rows, fields){ 
        if (err) throw err;
        response.ok("Success Create Vehicle Brand", res);
    });
}

// change data according ID vehicle brand
// output: {status, values}
exports.patchVehiclesBrand = function(req, res){
    var id = req.body.id;
    var name = req.body.name;
    connection.query("UPDATE vehicle_brand SET name=? WHERE id=?", [name, id],
    function(err, rows, fields){
        if (err) throw err;
        response.ok("Success Update Vehicle Brand", res);
    });
}

// delete data according ID vehicle brand
// output: {status, values}
exports.deleteVehiclesBrand = function(req, res){
    var id = req.body.id;
    connection.query("DELETE FROM vehicle_brand WHERE id=?", [id],
    function(err, rows, fields){
        if (err) throw err;
        response.ok("Success Delete Data Vehicle Brand ID: " + id, res);
    });
}

// get all vehicles data grouping
// output: {status, values: {id, name, created_at, updated_at}}
exports.getAllVehicleBrandGroup = function(req, res){
    connection.query("SELECT vehicle_brand.id, vehicle_brand.name, vehicle_type.name as types FROM vehicle_type JOIN vehicle_brand WHERE vehicle_type.brand_id = vehicle_brand.id", (err, rows, fields) => {
        if (err) throw err;
        response.nested(rows, res)
    });
}