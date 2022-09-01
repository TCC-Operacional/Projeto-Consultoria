const https = require('https');

CadastroColaborador = (req, res) => {
  const colaborador = req.body;

  // const httpsAgent = new https.Agent({ rejectUnauthorized: false });

  var soap = require('soap');
  var url = 'http://ltw201904:8181/g5-senior-services/rubi_Synccom_senior_omega_tcc?wsdl';
  var args = colaborador;

  // request({ url : 'https://127.0.0.1', rejectUnhauthorized : false })

  // then/catch
  // process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0"
  soap.createClientAsync(url).then((client) => {
    return client.InsereFuncionario(args);
  }).then((result) => {
    console.log(result);
  }).catch((err) => {
    console.log(err);
  });

  // async/await
  // var client = await soap.createClientAsync(url);
  // var result = await client.MyFunctionAsync(args);
  // console.log(result[0]);

}

module.exports = {
  CadastroColaborador
}