'use strict';

const { response } = require("express");

exports.ok = function(values, res){
    var data = {
        'status' : 200,
        'values' : values
    };

     res.json(data);
     res.end();
}

// response nested
exports.nested = function(values, res){
    // const result = values.reduce((acc, item) => {
    //     if (acc[item.name]){
    //         const group = acc[item.name];
    //         if (Array.isArray(group.vehicle_type)){
    //             group.vehicle_type.push(item.vehicle_type);
    //         } else {
    //             group.vehicle_type = [group.vehicle_type, item.vehicle_type];
    //         }
    //     } else {
    //         acc[item.name] = item;
    //     }
    //     return acc;
    // }, {});

    const result = values.reduce((groupBrand, {id, name, types}) => {
        if (!groupBrand[name]) groupBrand[name] = {id, name, types: []};
        groupBrand[name].types.push(types);
        return groupBrand;
    }, {});

    var data = {
        'status' : 200,
        'values' : result
    };

    res.json(data);
    res.end();
}

exports.bad = function(values, res){
    var data = {
        'status' : 401,
        'values' : values
    }

    res.json(data);
    res.end();
}