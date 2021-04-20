const { Usuario } = require('../models')
module.exports = async (request, response, next) => {

    let { nome, senha, email } = request.body;
    let users = await Usuario.findAll({ where: { email } });

    if (!nome) {
        return response.status(400).json({ erro: "Campo de nome não preenchido" })
    } else {
        if (!senha) {
            return response.status(400).json({ erro: "Campo de senha não preenchido" })
        } else {
            if (!email) {
                return response.status(400).json({ erro: "Campo de email não preenchido" })
            } else {
                if (users.length) {
                    return response.status(400).json({ erro: "Email já cadastrado" })
                } else {
                    if (senha.length > 6 || senha <= 12) {
                        return response.status(400).json({ erro: "Senha deve ser maior que 6 e menor que 12" })
                    } else {               
                        next();
                    }
                    next();
                }
                next();
            }
            next();
        }
        next();
    }
}