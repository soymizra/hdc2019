// Instalación y configuracion de conexion a mysql
const Sequelize = require('sequelize');
const db = new Sequelize('icookdb','root','',{
    host: 'localhost',
    dialect:'mysql',
    port:'3306',
    operatorAliases: false,
    define:{
        timestamps: false
    },
    pool:{
        max: 5,
        min: 0,
        acquire: 30000,
        idler: 10000
    }
});

module.exports = db;