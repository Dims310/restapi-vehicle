var connection = require('../connection');
var mysql = require('mysql');
var md5 = require('md5');
var response = require('../res');
var jwt = require('jsonwebtoken');
var config = require('../config/secret');

// register 
exports.register = function(req, res){
    var post = {
        name: req.body.name,
        password: md5(req.body.password),
        is_admin: req.body.is_admin
    }

    var query = "INSERT INTO ?? SET ?";
    var table = ["users"];
    query = mysql.format(query, table);
    connection.query(query, post, function(err, rows){
        if (err) throw err
        response.ok("Success Create A New User", res)
    });
}

// login
exports.login = function(req, res){
    var post = {
        name: req.body.name,
        password: req.body.password
    }

    var query = "SELECT * FROM ?? WHERE ??=? AND ??=?";
    var table = ["users", "name", post.name, "password", md5(post.password)];
    query = mysql.format(query, table);

    connection.query(query, post, function(err, rows){
        if (err) throw err;
        if (rows.length == 1){
            var token = jwt.sign({rows}, config.secret, {
                expiresIn: 15 // 15 seconds, just to make sure is it expired soon
            });
            user_id = rows[0].id;

            var data = {
                user_id: user_id,
                access_token: token,
            }
            
            connection.query("INSERT INTO access_token (user_id, token) VALUES (?, ?)", [data.user_id, data.access_token], function(err, rows){
                if(err) throw err;
                 res.json({
                    success: true,
                    message: "Token Generated.",
                    token: token,
                    current_user: data.user_id
                 });
            });
        } else {
            response.bad("User Not Found or Wrong Password.", res);
        }
    });
}

exports.admin = function(req, res){
    response.ok("Admin Page", res);
}