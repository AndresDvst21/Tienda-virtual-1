const mongoose = require('mongoose');
const bcrypt = require('bcrypt');

const UsuariosSchema = new mongoose.Schema({
    Email:{
        type: String,
        unique: true,
        lowercase: true,
        trinm: true
    },

    Nombre:{
        type: String,
        require: 'Agrega tu Nombre',
    },

    Contraseña:{
        type: String,
        require: true,
        trim: true,
    },

    Token: String,
    expira: Date,
    Imagen: String,
});

//Enviar alerta
UsuariosSchema.post('save', function(error, doc, next){
    if(error.code === 11000){
        next('Ese correo esta registrado')
    } else {
        next(error);
    }
});

//Hash
UsuariosSchema.pre('save', async function(next){
    //Si ya esta haseahdo
    if(!this.isModified('Contraseña')){
        return next();
    }

    //Si no esta haseahdo
    const hash = await bcrypt.hash(this.Contraseña, 12)
    this.Contraseña = hash;
    next();
});

//Verificar usuario
UsuariosSchema.methods = {
    compararContraseña: function(Contraseña){
        return bcrypt.compareSync(Contraseña, this.Contraseña)
    }
};

module.exports = mongoose.model('Usuarios', UsuariosSchema);