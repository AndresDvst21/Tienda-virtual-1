const Productos = require('../Models/Productos');

exports.CrearTienda = async (req, res, next) => {
    const productos = await Productos.find();
    if (!productos) return next();

    res.render('Tienda', {
        Productos: productos
    });
};

exports.ProductosUrl = async (req, res, next) => {
    const Producto = await Productos.findOne({ Imagen: req.params.Url }); // Usar Productos en lugar de productos
    res.render('producto', { Producto });
};


