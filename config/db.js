const mongoose = require('mongoose');


mongoose.connect('mongodb+srv://andresdvst:andres25@tiendacluster.tsqscps.mongodb.net/TiendaVirtual', {useNewUrlParser: true});

mongoose.connection.on('error', (error) => {
    console.log(error);
});

//Importar Modelos
require('../Models/Usuarios');
require('../Models/Productos');
require('../Models/Direcciones');