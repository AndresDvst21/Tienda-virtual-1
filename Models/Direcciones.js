const mongoose = require('mongoose')
const { modelName } = require('./Usuarios')

const DireccionSchema = new mongoose.Schema({
    Nombre:{
        type: String,
        required: true
    },

    Apellido:{
        type: String,
        required: true
    },

    Telefono:{
        type: String,
        required: true
    },

    Direccion:{
        type: String,
        required: true
    },

    Numeracion:{
        type: String,
        required: true
    },

    Ciudad:{
        type: String,
        required: true
    },

    UsuarioId:{
        type: String
    },
})

module.exports = mongoose.model('Direcciones', DireccionSchema)