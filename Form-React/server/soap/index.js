var soap = require('soap');
var url = 'http://example.com/wsdl?wsdl';
var args = {name: 'value'};

// then/catch
soap.createClientAsync(url).then((client) => {
  return client.MyFunctionAsync(args);
}).then((result) => {
  console.log(result);
});

// async/await
var client = await soap.createClientAsync(url);
var result = await client.MyFunctionAsync(args);
console.log(result[0]);