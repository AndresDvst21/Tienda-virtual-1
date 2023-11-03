const express = require('express');
const routes = require('./routes/index');
const path = require('path');
const mongoose = require('mongoose');
const cookieParser = require('cookie-parser');
const session = require('express-session');
const flash = require('express-flash');
const connectFlash = require('connect-flash');
const MongoStore = require('connect-mongo');
const passport = require('./config/passport');
const bodyParse = require('body-parser');
const expressValidator = require('express-validator');

// Crear app express
require('./config/db');
const app = express();

// Habilitar Body Parse
app.use(bodyParse.json());
app.use(bodyParse.urlencoded({ extended: true }));

// Archivos Estáticos
app.use(express.static('public'));

// Validar Campos
app.use(expressValidator());

// Crear Sesión
app.use(cookieParser());
app.use(
    session({
    secret: 'secreto',
    key: 'password',
    resave: false,
    saveUninitialized: false,
    store: MongoStore.create({
        mongoUrl:
        'mongodb+srv://andresdvst:andres25@tiendacluster.tsqscps.mongodb.net/TiendaVirtual',
    }),
    })
);

// Configurar Flash
app.use(flash());

// Configurar Passport
app.use(passport.initialize());
app.use(passport.session());

// Configurar Connect Flash
app.use(connectFlash());

// Middleware para mensajes flash
app.use((req, res, next) => {
    console.log(req.user);
    res.locals.usuario = {...req.user} || null;
    res.locals.mensajes = req.flash();
    next();
});

// Rutas
app.use('/', routes());

// Configurar el motor de vistas pug y carpeta de vistas
app.set('view engine', 'pug');
app.set('views', path.join(__dirname, './views'));

// Iniciar el servidor
app.listen(3000);
