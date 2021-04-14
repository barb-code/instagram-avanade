const { request, response } = require('express');
const { Comentario, sequelize } = require('../models/');

const comentariosController = {
    index: async (request, response) => {
        let comentarios =  await Comentario.findAll();
        
        return response.json(comentarios);
    },

    create: async (request, response) => {
        let {texto, usuarios_id, posts_id} = request.body;

        let novoComentario = await Comentario.create({
            texto,
            usuarios_id,
            posts_id
        });

        return response.json(novoComentario);
    },
    update: async (request, response) => {
        let { id } = request.params;
        let {texto, usuarios_id, posts_id} = request.body;

        let comentarioAtualiazado = await Comentario.update({
            texto,
            usuarios_id,
            posts_id
        }, {
            where: { id }
        })

        return response.send(comentarioAtualiazado);
    },
    delete: async (request, response) => {
       
        let { id } = request.params;

        const comentarioDeletado = await Comentario.destroy({
            where: {id}
        });

        return response.json(comentarioDeletado);
        
    },

    show: async(request, response) => {
        const { id } = request.params;

        const comentariosPost = await Comentario.findAll({
            where: {
                posts_id: id
            }
        });

        return response.json(comentariosPost);
    }

}

module.exports = comentariosController;