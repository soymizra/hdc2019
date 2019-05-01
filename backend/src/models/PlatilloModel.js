const Sequelize = require('sequelize');

const db = require('../config/db');

const Platillos = db.define('Platillos',{
    id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    nombre: {
        type: Sequelize.STRING(50)
    },
    imagen: Sequelize.STRING,
    descripcion: Sequelize.STRING,
    precio: Sequelize.DECIMAL,
    idTipoDisponible: Sequelize.INTEGER,
    idUsuario: Sequelize.INTEGER,
    url: Sequelize.STRING
});

module.exports = Platillos;