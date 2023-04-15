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
        .post(json.postVehiclesBrand);

    app.route('/vehicle/brand/update')
        .patch(json.patchVehiclesBrand);

    app.route('/vehicle/brand/delete')
        .delete(json.deleteVehiclesBrand);

    app.route('/vehicle/brand/types')
        .get(json.getAllVehicleBrandGroup);
}