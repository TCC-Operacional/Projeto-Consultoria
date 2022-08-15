# Projeto-Consultoria
### Projeto criado para organizar os arquivos da entrega do TCC da Academia Lobtec.

<h4>Fluxo de Desenvolvimento</h4>

* <i>Criação de um formulário para cadastro do colaborador através do BPM;</i>
* Criação de uma tabela nova no CDBS que espelha a R034FUN com os campos obrigatórios e com o nome personalizado do nosso grupo: USU_Tfun1;
  - adição de novo campo com enumerador para diferenciar nossa tabela das dos outros grupos: USU_ACADEMIA. Cadastro dos nossos funcionários com o valor 1 neste campo;
  - <i>desenvolvimento de lógica para cadastro automático de número de matrícula do colaborador;</i>
* Criação de um Web Service para cadastrar o novo colaborador na tabela criada;
* Acesso pelo nosso Web Service a um Web Service Interno (já existente e não editado por nós) para cadastrar o novo colaborador na tabela R034FUN;
* Criação de uma tela através do SGI para listar os registros da nova tabela;
  - adição de um botão para exibir um relatório;
* Desenvolvimento de um relatório que lista os dados inseridos na tabela espelhada e na R034FUN;
  - exibição de cabeçalho;
  - listagem de registros inseridos nas duas tabelas;
  - coluna que mostra inconsistências nas inserções (caso tenha inserido na tabela espelhada e não na original);
  - exibição de rodapé com total de registros em cada tabela (relacionados com os que inserimos) e o status (S caso esteja em ambas e N caso esteja apenas na espelhada); 
* Criação de um exportador da tabela USU_Tfun1;
* Organização do Painel de Gestão para verificar os registros cadastrados em ambas as tabelas com o enumerador do tipo 1 (do nosso grupo).


## Recursos do projeto


### Banco de dados 

**Tabela Espelhada:** USU_TFun1


### WebService

**Modulo Rubi** Recursos -> Implementações -> editor webservice

​	​	​No Editor de Web Services do Rubi em o projeto será feita no serviço **​com.senior.omega.tcc** em  **Provedor -> Interno -> ​com.senior.omega.tcc**   

```sql
                                                    
definir numero xNumEmp;
definir numero xTipCol;
definir numero xNumCad;
@definir alfa aNomFun;@
definir alfa aMsgRet;
definir funcao RetornaWebService();

@------------------------------------------------------------------------------@

nQtdLin = InsereFuncionario.TabEnt.QtdLinhas;

nQtd = 0;
enquanto(nQtd < nQtdLin) {

  InsereFuncionario.TabEnt.LinhaAtual = nQtd;

  xNumEmp = InsereFuncionario.TabEnt.empresa;
  xTipCol = InsereFuncionario.TabEnt.colaborador;
  xNumCad = InsereFuncionario.TabEnt.cadastro;
  @aNomFun = InsereFuncionario.TabEnt.funcionario;@
  aMsgRet = InsereFuncionario.retorno.MsgRet;
  
  se((xNumEmp = 0) ou (xTipCol = 0) ou (xNumCad = 0)) {
    aMsgRet = "Chave inválida!";
    InsereFuncionario.retorno.MsgRet = aMsgRet;
  } senao {
    IniciarTransacao();
    ExecSQLEx("insert into USU_Tfun1(USU_NumEmp, USU_TipCol, USU_NumCad) \
                 values(:xNumEmp, :xTipCol, :xNumCad)", nCodErr, aMsgRet)
    
    se(nCodErr = 0) {
      FinalizarTransacao();
      aMsgRet = "Funcionário inserido com sucesso!"
    } senao {
      DesfazerTransacao();
      aMsgRet = "Falha ao inserir funcionário..."
    }

    RetornaWebService();
  }

  nQtd++;  
}

@------------------------------------------------------------------------------@

funcao RetornaWebService(); {
  InsereFuncionario.CriarLinha();
  InsereFuncionario.CodRet = nErro;
  InsereFuncionario.MsgRet = aMsgRet;
}

```


criando posto de trabalho e as características colocadas vão ser o local que a pessoa vai trabalhar, empresa e filial

<div style="text-align:center;">
<h2> Sequencia de telas para criação de postos de trabalho<h2/>

![image](https://user-images.githubusercontent.com/44294260/184698349-0425caca-7590-409b-af73-462371970a0f.png)

![image](https://user-images.githubusercontent.com/44294260/184698392-7cf64ed0-1caa-49ee-9fb8-c0c84fb9b782.png)

![image](https://user-images.githubusercontent.com/44294260/184698420-6b508ca2-9b97-4347-9d4e-4340a1ea59f2.png)

![image](https://user-images.githubusercontent.com/44294260/184698448-9429a90a-8e9e-444a-b340-f61c72fa5165.png)

![image](https://user-images.githubusercontent.com/44294260/184698735-8f5a5fa3-d5b9-43ba-a7ec-e57f2b14d22d.png)

![image](https://user-images.githubusercontent.com/44294260/184698750-6849f61d-01b3-48fa-9b86-67504e8279ee.png)

![image](https://user-images.githubusercontent.com/44294260/184698783-e8a5cd2b-47f2-4678-b382-2d95b8092b0d.png)

![image](https://user-images.githubusercontent.com/44294260/184698828-0f80bf50-8915-46b8-aaa5-67438fb099b7.png)

![image](https://user-images.githubusercontent.com/44294260/184698848-b14ace86-15c4-4ef1-921f-7063d42f549c.png)

![image](https://user-images.githubusercontent.com/44294260/184698888-c5c296b7-775e-479d-aafb-1e761d0f486f.png)

![image](https://user-images.githubusercontent.com/44294260/184698954-ba95d17f-e0c2-4da5-bbc8-73671b6096c7.png)

<div/>


#### Os Postos de trabalho
  
  * Postos Omega 01 - Empresa e filial 1
  * posto Omega 02 - Empresa = 1 e filial = 2 




  
