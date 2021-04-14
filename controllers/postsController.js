const { request, response } = require('express');
const { Post, sequelize } = require('../models/');

const postsController = {
    index: async (request, response) => {
        let posts =  await Post.findAll();
        
        return response.json(posts);
    },

    create: async (request, response) => {
        let {texto, img, usuarios_id} = request.body;

        let novoPost = await Post.create({
            texto,
            img,
            usuarios_id
        });

        return response.json(novoPost);
    },
    update: async (request, response) => {
        let { id } = request.params;
        let { texto, img, usuarios_id } = request.body;

        let postAtualizado = await Post.update({
            texto, 
            img, 
            usuarios_id
        }, {
            where: { id }
        })

        return response.send(postAtualizado);
    },
    delete: async (request, response) => {
       
        let { id } = request.params;

        const postDeletado = await Post.destroy({
            where: {id}
        });

        return response.json(postDeletado);
        
    }

}

module.exports = postsController;