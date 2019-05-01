const express = require('express'),
      path = require('path'),
      morgan = require('morgan'),
      mysql = require('mysql'),
      myConnection = require('express-myconnection');

// conexion a la base de datos
const db = require('./config/db');

// import modelo
require('./models/Proyectos');

db.sync()
    .then(() => console.log('Conectado al server'))
    .catch(err => console.log('Error sequilize:'+err))


      const app = express();

// importing routes
const apiRoutes = require('./routes/api');
const indexRoutes = require('./routes/index');

// settings
app.set('port', process.env.PORT || 3000);
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

// middlewares
app.use(morgan('dev'));



app.use(express.urlencoded({extended: false}));

// routes
app.use('/api', apiRoutes);
app.use('/', indexRoutes);

// static files
app.use(express.static(path.join(__dirname, 'public')));

// starting the server
app.listen(app.get('port'), () => {
  console.log(`server on port ${app.get('port')}`);
});