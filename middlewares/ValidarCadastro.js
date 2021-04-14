const { Usuario } = require('../models')
module.exports = async (request, response, next) => {
    
    let { nome, senha, email } = request.body;
    let users = await Usuario.findAll({ where: { email } });

    if (!nome) {
        response.status(400).json({ erro: "Campo de nome não preenchido" })
    } else {
        if (!senha) {
            response.status(400).json({ erro: "Campo de senha não preenchido" })
        } else {
            if (!email) {
                response.status(400).json({ erro: "Campo de email não preenchido" })
            } else {
                if (users.length) {
                    response.status(400).json({ erro: "Email já cadastrado" })
                    return;
                } else {
                    next();
                }
                next();
            }
            next();
        }
        next();
    }
}