const express = require('express');
const router = express.Router();
//Importar controlador

const homeControllers = require ('../controllers/homeControllers');
const usuariosController = require('../controllers/usuariosControllers');
const authController = require('../controllers/authController');
const tiendaController = require('../controllers/tiendaController');
const administracionController = require('../controllers/administracionController');
const { ensureAuthenticated } = require('../config/passport');
const checkController = require('../controllers/checkController');

module.exports = function(app){
    //Ruta Home
    router.get('/', homeControllers.home );

    //Crear Cuenta
    router.get('/crear-cuenta', usuariosController.formCrearUsuario);
    router.post('/crear-cuenta', usuariosController.validarRegistro,
    usuariosController.CrearUsuario);

    //Mi Cuenta
    router.get('/mi-cuenta', administracionController.MiCuenta);
    router.get('/mis-datos', administracionController.FormEditarDatos);
    router.post('/mis-datos', administracionController.EditarDatos);

    //Mis Direcciones
    router.get('/Direcciones', administracionController.Direcciones);
    router.get('/Direcciones/Agregar', administracionController.formAgregarDireccion);
    router.post('/Direcciones/Agregar', administracionController.AgregarDireccion);

    //Iniciar Session
    router.get('/iniciar-sesion', usuariosController.formIniciarSesion);
    router.post('/iniciar-sesion', authController.authenticate);
    
    //Cerra sesion
    router.get('/cerrar-sesion', 
    authController.usuarioAutenticado,
    authController.cerrarsesion);

    //Tienda
    router.get('/Tienda', 
    authController.usuarioAutenticado,
    tiendaController.CrearTienda);
    router.get('/Tienda/:Url', tiendaController.ProductosUrl);

    //Carrito
    router.get('/carrito', checkController.mostarCarrito);
    return router;
};