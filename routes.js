'use strict'

module.exports = function(app){
    var json = require('./controller');

    app.route('/')
        .get(json.index);

    app.route('/users')
        .get(json.getAllUser);

    app.route('/vehicle/create')
        .post(json.postVehicles);
}