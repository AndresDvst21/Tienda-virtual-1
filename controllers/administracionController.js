const usuarios = require('../Models/Usuarios')
const Direcciones = require('../Models/Direcciones')

exports.MiCuenta = async(req, res, next) =>{
    res.render('mi-cuenta')
}

exports.FormEditarDatos = async (req, res, next) => {
    try {
        const usuario = await usuarios.findOne({ _id: req.user._id });
        res.render('mis-datos', {
            usuario: usuario // Asegúrate de pasar la variable "usuario" en lugar de "usario"
        });
    } catch (error) {
        // Manejo de errores
    }
};

exports.EditarDatos = async (req, res, next) => {
    const datosusuarios = req.body
    const usuario = await usuarios.findOneAndUpdate({ _id: req.user._id },
        datosusuarios, {
            new:true,
            runValidator: true
        });

        req.flash('correcto', 'Mensaje de éxito');
        res.redirect(`/mi-cuenta`);
};

//Mis Direcciones
exports.Direcciones = async (req, res) => {
    const UsuarioId = req.user._id;

    const direcciones = await Direcciones.find({
        UsuarioId: UsuarioId
    });

    res.render('Direcciones', {
        direcciones
    });
};

//Agregar Direcciones
exports.formAgregarDireccion = async (req, res) => {
    const UsuarioId = req.user._id;
    res.render('AgregarDireccion', {
        UsuarioId: UsuarioId
    });
};

exports.AgregarDireccion = async (req, res) => {
    console.log('Datos del formulario:', req.body);

    const Direccion = new Direcciones(req.body);

    try {
        await Direccion.save();
        console.log('Dirección guardada con éxito');
        req.flash('Direccion Agregada', 'Dirección Guardada');
        res.redirect('/Direcciones');
    } catch (error) {
        console.error('Error al guardar la dirección:', error);
        req.flash('Datos no Válidos', 'Todos los campos son obligatorios');
        res.redirect('/Direcciones/Agregar');
    }
};

