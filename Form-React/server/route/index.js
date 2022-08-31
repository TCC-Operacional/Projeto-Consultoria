const express = require('express');

const Controller = require('../controller');

const router = express.Router();

router.post('/colaborador', Controller.CadastroColaborador);

module.exports = router;