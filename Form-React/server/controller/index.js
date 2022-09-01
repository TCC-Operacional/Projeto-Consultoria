
CadastroColaborador = (req, res) => {
  const colaborador = req.body;
  var args = {   
    user: 'senior',
    password: 'senior',
    encryption: '0',
    parameters: {
      ...colaborador
    } 
  }

  webService();

  // async/await
  async function webService() {
    try {
      var soap = require('soap');
      var url = 'https://ltw201904:8181/g5-senior-services/rubi_Synccom_senior_omega_tcc?wsdl';
  
      var client = await soap.createClientAsync(url, process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0");
      var result = await client.InsereFuncionarioAsync(args);
      console.log(result[0]);
    } catch (error) {
      console.log({ error });
    }
  }

}

module.exports = {
  CadastroColaborador
}