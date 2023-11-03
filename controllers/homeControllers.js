//Ruta Home
exports.home = (req, res) => {
    res.render('Home', {
        Pagina: 'Index',
    });
};

//Ruta Productos
exports.Productos = (req, res) =>{
    res.render('Productos');
};