const mongoose = require('mongoose');
const Usuario = mongoose.model('Usuarios');
const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;

passport.use(new LocalStrategy({
    usernameField: 'Email',
    passwordField: 'Contraseña',
}, 
async (Email, Contraseña, done) => {
    try {
        const usuario = await Usuario.findOne({ Email }); // Utiliza "await" aquí para esperar la respuesta
        if (!usuario) {
            return done(null, false, {
                message: 'Usuario no existe'
            });
        }

        // Verificar contraseña
        const verificarContra = await usuario.compararContraseña(Contraseña);
        if (!verificarContra) {
            return done(null, false, {
                message: 'Contraseña inválida'
            });
        }

        // Usuario autenticado
        return done(null, usuario);

    } catch (error) {
        // Usuario no existe
        return done(null, false, {
            message: 'Esta cuenta no existe'
        });
    }
}));

// Serializa Usuario
passport.serializeUser((usuario, callback) => {
    callback(null, usuario.id);
});

// Deserializa Usuario
passport.deserializeUser((id, callback) => {
    Usuario.findById(id)
        .then(usuario => {
            callback(null, usuario);
        })
        .catch(error => {
            callback(error, null);
        });
});

module.exports = passport;

// Middleware de autenticación
function ensureAuthenticated(req, res, next) {
    if (req.isAuthenticated()) {
        return next(); // El usuario está autenticado, permite el acceso.
    }
    res.redirect('/iniciar-sesion'); // Redirige al usuario a la página de inicio de sesión si no está autenticado.
}

// Ruta para la vista de agregar dirección (asegurándote de que el usuario esté autentica
