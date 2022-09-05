Definir Funcao main();

@@
definir alfa aPresenteEmFun;
definir alfa aPresenteEmUsu;
Definir alfa aConsistente;
Definir numero xConsistentes;
Definir numero xCountFun;
Definir numero xCountUsu;

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
    xConsistentes = 0;
    xCountFun = 0;
    xCountUsu = 0;
}


Funcao iniciarCursorR034FUNcompareUSUTFun1();{

    aSQLfulljoin = "SELECT                                                     \                      
                        numemp, numcad, tipcol, nomfun,                        \     
                        USU_numemp, USU_numcad, USU_tipcol, USU_nomfun         \
                      FROM r034fun fun                                         \                   
                   FULL OUTER JOIN USU_T_Omega usu                             \                
                      ON  numemp = USU_numemp                                  \          
                      and numcad = USU_numcad                                  \         
                      and tipcol = USU_tipcol                                  \         
                    where fun.USU_academia = 1                                 \
                       or usu.USU_academia = 1                                 \
                 order by fun.numcad, usu.usu_numcad";    

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
        
        xTotalRegistros ++;

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
        aNomeFunView = aNumeroCadastro + " - " + aFunNomFun;
    }senao {
        IntparaAlfa(nTuserUSUNumCad , aNumeroCadastro);
        aNomeFunView = aNumeroCadastro + " - " + aTuserUSUNomFun;
    }
}

Funcao existeColaborador();{

    se(nFunNumCad <> 0){
        xCountFun ++;
        aPresenteEmFun = "•";
        alteraControle("imagem_fun_false", "imprimir", "falso");
        alteraControle("imagem_fun_true", "imprimir", "verdadeiro");
    }senao {
        aPresenteEmFun = "";
        alteraControle("imagem_fun_true", "imprimir", "falso");
        alteraControle("imagem_fun_false", "imprimir", "verdadeiro");    
    }

    
    se(nTuserUSUNumCad <> 0){
        xCountUsu ++;
        aPresenteEmUsu = "•";
        alteraControle("imagem_usu_false", "imprimir", "falso");
        alteraControle("imagem_usu_true", "imprimir", "verdadeiro");
    }senao  {
        aPresenteEmUsu = "";
        alteraControle("imagem_usu_true", "imprimir", "falso");
        alteraControle("imagem_usu_false", "imprimir", "verdadeiro");
    }
    
    
    se((nFunNumCad <> 0) e (nTuserUSUNumCad <> 0)){
        xConsistentes ++;
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