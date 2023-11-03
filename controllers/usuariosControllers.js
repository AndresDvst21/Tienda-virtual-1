const mongoose = require("mongoose");
const Usuarios = require("../Models/Usuarios");

exports.formCrearUsuario = (req, res) => {
    res.render("crear-cuenta");
};

exports.validarRegistro = (req, res, next) => {
    req.sanitizeBody("Nombre").escape(); 
    req.sanitizeBody("Email").escape();
    req.sanitizeBody("Contraseña").escape();

    req.checkBody("Nombre", "El Nombre es obligatorio").notEmpty();
    req.checkBody("Email", "El Email es obligatorio").notEmpty();
    req.checkBody("Contraseña", "El Contraseña es obligatorio").notEmpty();

    const errores = req.validationErrors();

    if (errores) {
        req.flash("Error", errores.map((error) => error.msg));
        res.redirect("/crear-cuenta");
    } else {
        next();
    }
};

exports.CrearUsuario = async (req, res, next) => {
    const usuario = new Usuarios(req.body);
    try {
        await usuario.save();
        res.redirect("/iniciar-sesion");
    } catch (error) {
        req.flash("error", "Este Correo ya está registrado");
        res.redirect("/crear-cuenta");
    }
};

exports.formIniciarSesion = (req, res) => {
    res.render("Iniciar-sesion");
};
