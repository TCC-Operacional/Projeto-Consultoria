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
## Postos de Trabalho
  
  * Postos Omega 01 - Empresa e filial 1
  * posto Omega 02 - Empresa = 1 e filial = 2 

criando posto de trabalho e as características colocadas vão ser o local que a pessoa vai trabalhar, empresa e filial


<h2> Sequencia de telas para criação de postos de trabalho </h2>

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

</div>



### Relatório

![image](https://user-images.githubusercontent.com/44294260/185628327-f6ca331f-99af-42f6-b991-66fc4b8a417a.png)


**Em Seção Detalhe**

```sql
Definir Funcao main();

@@
definir alfa aPresenteEmFun;
definir alfa aPresenteEmUsu;
Definir alfa aConsistente;

@Funcoes@
Definir Funcao atribuirParametros();
Definir Funcao iniciarCursorR034FUNcompareUSUTFun1();
Definir Funcao pegarDadosTabela();
Definir Funcao retornarDados();
Definir Funcao definirNomeFuncionario();
Definir Funcao existeColaborador();
Definir Funcao limparVariaveis();


@variaveis de parametro@
Definir numero nFunNumEmp;

@Cursor da tabela@
Definir Alfa cTr034funUSUTOmega;
Definir Alfa aSQLfulljoin;

@dados da tabela r034fun@
Definir numero nFunNumEmp;
Definir numero nFunNumCad;
Definir numero nFunTipCol;
Definir alfa aFunNomFun;

@dados da tabela USU_TFun1@
Definir numero nTuserUSUNumEmp;
Definir numero nTuserUSUNumCad;
Definir numero nTuserUSUTipCol;
Definir alfa aTuserUSUNomFun;

@Secao a ser listado@
Definir alfa aNomeSecao;

Definir alfa aNomeFunView;


main();

Funcao main();{
    atribuirParametros();
    iniciarCursorR034FUNcompareUSUTFun1();
    pegarDadosTabela();
}



Funcao atribuirParametros();{
    aNomeSecao = "Adicional_1";
    nFunNumEmp = 1;
}


Funcao iniciarCursorR034FUNcompareUSUTFun1();{

    aSQLfulljoin = "SELECT                                                                           \
                        numemp, numcad, tipcol, nomfun,                             \
                        USU_numemp, USU_numcad, USU_tipcol, USU_nomfun      \
                    FROM r034fun                                                                \
                    FULL OUTER JOIN USU_T_Omega                                                 \
                        ON  numemp = USU_numemp                                            \
                        and numcad = USU_numcad                                           \
                        and tipcol = USU_tipcol                                           \
                        where r034fun.USU_academia = 1";    

    SQL_Criar(cTr034funUSUTOmega);
    SQL_UsarAbrangencia(cTr034funUSUTOmega, 0);
    SQL_UsarSQLSenior2(cTr034funUSUTOmega, 0);
    SQL_DefinirComando(cTr034funUSUTOmega, aSQLfulljoin);
    @SQL_DefinirInteiro(cTr034funUSUTOmega, "FunNumEmp", nFunNumEmp); @

}

Funcao pegarDadosTabela();{

    SQL_AbrirCursor(cTr034funUSUTOmega);
    Enquanto (SQL_EOF(cTr034funUSUTOmega) = 0)
    {

        limparVariaveis();

        SQL_RetornarInteiro(cTr034funUSUTOmega, "numemp", nFunNumEmp);
        SQL_RetornarInteiro(cTr034funUSUTOmega, "numcad", nFunNumCad);
        SQL_RetornarInteiro(cTr034funUSUTOmega, "tipcol", nFunTipCol);
        SQL_RetornarAlfa(cTr034funUSUTOmega, "nomfun", aFunNomFun);
        SQL_RetornarInteiro(cTr034funUSUTOmega, "USU_numemp", nTuserUSUNumEmp);
        SQL_RetornarInteiro(cTr034funUSUTOmega, "USU_numcad", nTuserUSUNumCad);
        SQL_RetornarInteiro(cTr034funUSUTOmega, "USU_tipcol", nTuserUSUTipCol);
        SQL_RetornarAlfa(cTr034funUSUTOmega, "USU_nomfun", aTuserUSUNomFun);

        
        SQL_Proximo(cTr034funUSUTOmega);

        definirNomeFuncionario();
        existeColaborador();
        ListaSecao(aNomeSecao);
    }
    SQL_FecharCursor(cTr034funUSUTOmega);
    SQL_Destruir(cTr034funUSUTOmega);
}


Funcao definirNomeFuncionario();{
    Definir alfa aNumeroCadastro; 
         

    se (aFunNomFun <> ""){
        IntparaAlfa(nFunNumCad , aNumeroCadastro);
        aNomeFunView = aNumeroCadastro + " " + aFunNomFun;
    }senao {
        IntparaAlfa(nTuserUSUNumCad , aNumeroCadastro);
        aNomeFunView = aNumeroCadastro + " " + aTuserUSUNomFun;
    }
}

Funcao existeColaborador();{

    se(nFunNumCad <> 0){
        aPresenteEmFun = "•";
        alteraControle("imagem_fun_false", "imprimir", "falso");
        alteraControle("imagem_fun_true", "imprimir", "verdadeiro");
    }senao {
        aPresenteEmFun = "";
        alteraControle("imagem_fun_true", "imprimir", "false");
        alteraControle("imagem_fun_false", "imprimir", "verdadeiro");    
    }

    
    se(nTuserUSUNumCad <> 0){
        aPresenteEmUsu = "•";
        alteraControle("imagem_usu_false", "imprimir", "falso");
        alteraControle("imagem_usu_true", "imprimir", "verdadeiro");
    }senao  {
        aPresenteEmUsu = "";
        alteraControle("imagem_usu_true", "imprimir", "falso");
        alteraControle("imagem_usu_false", "imprimir", "verdadeiro");
    }
    
    
    se((nFunNumCad <> 0) e (nTuserUSUNumCad <> 0)){
        aConsistente = "Consistente"; 
    }
    
}

Funcao limparVariaveis();{
    
    nFunNumEmp = 0;
    nFunNumCad = 0;
    nFunTipCol = 0;
    aFunNomFun = "";


    nTuserUSUNumEmp = 0;
    nTuserUSUNumCad = 0;
    nTuserUSUTipCol = 0;
    aTuserUSUNomFun = "";

    aPresenteEmFun = "";
    aPresenteEmUsu = "";
    aConsistente = "Inconsistente";
}


/*
    * 
*/
```

![image](https://user-images.githubusercontent.com/44294260/185628204-652f4c41-7d27-429b-9b0a-989c222fa164.png)


### Tela SGI

Em gestão de Pessoas 

recursos -> gerador de telas

** Interfaces usadas **

![image](https://user-images.githubusercontent.com/44294260/185626951-3a0f7983-afa3-42c6-93fe-72eed8f389e9.png)

![image](https://user-images.githubusercontent.com/44294260/185627260-f324b576-b4ad-4d7a-8236-99b795a37d27.png)

![image](https://user-images.githubusercontent.com/44294260/185627491-5425f247-85d9-48c7-a2a8-24c311414989.png)

em Regras 

```
ExecutaRelatorio("FPRE188.COL", "N");
```

**Em  Formulários X-Window**

![image](https://user-images.githubusercontent.com/44294260/185627757-5e77e903-be42-4644-88a6-fd6c2cd01e69.png)

![image](https://user-images.githubusercontent.com/44294260/185628073-e2e72942-e62b-4c90-bfae-78655ea40af6.png)




