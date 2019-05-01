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
    url: Sequelize.STRING
});

module.exports = Platillos;



/**
 * IdPlatillo int(11) NOT NULL,
  `Nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `Imagen` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Descripcion` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `Precio` int(11) NOT NULL,
  `IdTipoPedido` int(11) NOT NULL,
  `IdentidadChef` varchar(15) COLLATE utf8_spanish_ci NOT NULL
 */