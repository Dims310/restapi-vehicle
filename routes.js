'use strict'

module.exports = function(app){
    var json = require('./controller');

    app.route('/')
        .get(json.index);

    app.route('/users')
        .get(json.getAllUser);

    app.route('/vehicle/brand')
        .get(json.getAllVehicleBrand);

    app.route('/vehicle/brand/create')
        .post(json.postVehicles);

    app.route('/vehicle/brand/update')
        .patch(json.patchVehicles);
}