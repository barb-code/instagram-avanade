const { request, response } = require('express');
const { Usuario, sequelize } = require('../models/');
const bcrypt = require('bcryptjs');

const usuariosController = {
    index: async (request, response) => {
        let usuarios =  await Usuario.findAll();
        
        return response.render('usuarios', { listaUsuarios: usuarios});
    },

    registro: (request, response) =>{
        return response.render('registro'); 
    },

    login: (request, response) =>{
        return response.render('login')
    },

    auth: async (request, response) => {
        const { email, senha } = request.body;

        const usuario = await Usuario.findOne({
            where:{ email }
        });

        if (usuario && bcrypt.compareSync(senha, usuario.senha)) {
            request.session.usuarioLogado = usuario;
            return response.redirect('/');

        }else{
            return response.redirect('usuarios/login');
        }
    },

    create: async (request, response) => {
        let {nome, email, senha} = request.body;

        let senhaCrypt = bcrypt.hashSync(senha, 10);

        let novoUsuario = await Usuario.create({
            nome,
            email,
            senha: senhaCrypt
        });
       
        return response.json(novoUsuario);
    },
    update: async (request, response) => {
        let { id } = request.params;
        let { nome, email, senha } = request.body;

        let usuarioAtualizado = await Usuario.update({
            nome, 
            email, 
            senha
        }, {
            where: { id }
        })

        return response.send(usuarioAtualizado);
    },
    delete: async (request, response) => {
       
        let { id } = request.params;

        const usuarioDeletado = await Usuario.destroy({
            where: {id}
        });

        return response.json(usuarioDeletado);
        
    }

}

module.exports = usuariosController;