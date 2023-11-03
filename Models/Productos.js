const mongoose = require('mongoose');

const ProductoSchema = new mongoose.Schema({
    Titulo: {
        type: String,
        required: true // Campo obligatorio
    },
    Precio: {
        type: Number,
        required: true // Campo obligatorio
    },
    Cantidad: {
        type: Number,
        required: true // Campo obligatorio
    },
    Imagen: String
});

module.exports = mongoose.model('Producto', ProductoSchema);