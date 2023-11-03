const passport = require('passport');

exports.authenticate = passport.authenticate('local', {
    successRedirect: '/',
    failureRedirect: '/iniciar-sesion',
    failureFlash: true,
    badRequestMessage: 'Ambos campos son obligatorios'
});

//Verificar Usuario
exports.usuarioAutenticado = (req, res, next) => {
    if(req.isAuthenticated()){
        return next();
    }
    //Sino
    return res.redirect('/iniciar-sesion');
}

//Cerrar sesion
exports.cerrarsesion = (req, res) => {
    req.logout(function(err) {
        if (err) {
            return next(err);
        }
        req.flash('correcto', 'Cerraste sesión');
        res.redirect('/iniciar-sesion');
    });
};
