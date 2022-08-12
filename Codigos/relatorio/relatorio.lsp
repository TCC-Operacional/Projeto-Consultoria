Definir Funcao main();

@Funcoes@
Definir Funcao atribuirParametros();
Definir Funcao iniciarCursorR034FUNcompareUSUTFun1();
Definir Funcao pegarDadosTabela();
Definir Funcao retornarDados();


@variaveis de parametro@
Definir numero nFunNumEmp;

@Cursor da tabela@
Definir Alfa cTr034funTUSUFun1;
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


main();

Funcao main();{
    atribuirParametros();
    iniciarCursorR034FUNcompareUSUTFun1();
    pegarDadosTabela();
}



Funcao atribuirParametros();{
    @aNomeSecao = ;@
    @nFunNumEmp = ;@
}


Funcao iniciarCursorR034FUNcompareUSUTFun1();{

    aSQLfulljoin = "SELECT 
                        Fun.numemp, Fun.numcad, Fun.tipcol, fun.nomfun,                             \
                        Tuser.USU_numemp, Tuser.USU_numcad, Tuser.USU_tipcol, Tuser.USU_nomfun      \
                    FROM r034fun Fun                                                                \
                    FULL OUTER JOIN USU_TFun1 Tuser                                                 \
                        ON Fun.numemp = Tuser.USU_numemp                                            \
                        and Fun.numcad = Tuser.USU_numcad                                           \
                        and Fun.tipcol = Tuser.USU_tipcol                                           \
                        where Fun.numemp = :FunNumEmp";    

    SQL_Criar(cTr034funTUSUFun1);
    SQL_UsarAbrangencia(cTr034funTUSUFun1, 0);
    SQL_UsarSQLSenior2(cTr034funTUSUFun1, 0);
    SQL_DefinirComando(cTr034funTUSUFun1, aSQLfulljoin);
    SQL_DefinirInteiro(cTr034funTUSUFun1, "FunNumEmp", nFunNumEmp);

}

Funcao pegarDadosTabela();{

    SQL_AbrirCursor(cTr034funTUSUFun1);
    Enquanto (SQL_EOF(cTr034funTUSUFun1) = 0)
    {

        SQL_RetornarInteiro(cTr034funTUSUFun1, "Fun.numemp", nFunNumEmp);
        SQL_RetornarInteiro(cTr034funTUSUFun1, "Fun.numcad", nFunNumCad);
        SQL_RetornarInteiro(cTr034funTUSUFun1, "Fun.tipcol", nFunTipCol);
        SQL_RetornarAlfa(cTr034funTUSUFun1, "fun.nomfun", aFunNomFun);
        SQL_RetornarInteiro(cTr034funTUSUFun1, "Tuser.USU_numempn", nTuserUSUNumEmp);
        SQL_RetornarInteiro(cTr034funTUSUFun1, "Tuser.USU_numcad", nTuserUSUNumCad);
        SQL_RetornarInteiro(cTr034funTUSUFun1, "Tuser.USU_tipcol", nTuserUSUTipCol);
        SQL_RetornarAlfa(cTr034funTUSUFun1, "Tuser.USU_nomfun", aTuserUSUNomFun);

        retornarDados();

        SQL_Proximo(cTr034funTUSUFun1);
    }
    SQL_FecharCursor(cTr034funTUSUFun1);
    SQL_Destruir(cTr034funTUSUFun1);
}


Funcao listarSecao();{

    ListaSecao(aNomeSecao);

}