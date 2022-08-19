@---- Funções ----@
definir funcao VariaveisValorFixo();
definir funcao DefineValores();
definir funcao RetornarMaiorNumCad();                                                 
definir funcao PreencheVazios();   
definir funcao RetornaWebService();


@---- Parâmetros de entrada e saída ----@
definir numero xNumCad;
definir numero xTipCon;
definir numero xEstCiv;
definir numero xGraIns;
definir numero xCodNac;
definir numero xConRho;
definir numero xEstCar;
definir numero xEstPos;
definir numero xCodFil;
definir numero xNumLoc; @ pode ser 115 (produção), 124(RH) ou 130(financeiro) @
definir numero xCodErr; 
definir numero xCatEso; @ A definir @
definir numero xCodEtb; @ A definir @
definir numero xTipAdm; @ A definir @
definir numero xRacCor; @ A definir @
definir numero xCatSef; @ A definir @
definir numero xNumCpf; @ A definir @
definir numero xValSalHsa; @ R038HSA qualquer valor @
definir numero xCplSalHsa; @ R038HSA - pode ser qualquer numero @
definir numero apuPonApu; @ R038APU - pode ser 1 ou 2@
definir numero codSinHsi;  @R014SIn - "1,2,3,4,5"@
definir numero tipSalHsa; @ R038HSA - pode ser 1 (mensalista), 2 (horista) ou 3(diarista)@


definir alfa aNomFun;                                                                           
definir alfa aTipSex;     
definir alfa aPerPag;
definir alfa aCotDef;
definir alfa aVerInt;
definir alfa aCodCar;
definir alfa aPosTra;
definir alfa aTipOpc;
definir alfa aModPag; @ A definir @
definir alfa aRecAdi; @ A definir @
definir alfa aRec13s; @ A definir @
definir alfa aLisRai; @ A definir @
definir alfa aPagSin; @ Valor = "S" ou "N" @


definir alfa aMsgRet;
definir data dDatAdm; 
definir data dDatNas;
definir data dDatOpc; @ A definir @
definir data dDatAltCcu; @ R038HCC @

@-----------Variaveis com Valores fixos------------@
definir numero xNumEmp; @ valor = 1 @
definir numero xTipCol; @ valor = 1 @
definir numero xAcademia; @ valor = 1 @
definir numero xCodTap; @ valor = 1 @
definir numero xSitAfa; @ valor = 1 @
definir numero xCodEsc; @ valor = 1 @
definir numero xTabOrg; @ valor = 1 @
definir numero xRacCor; @ R022vin - pode ser 15 @
definir numero xCodMotHsa; @ pode ser 1 @
definir numero xCodTmaHes; @ r006tma - pode ser 1 @

definir numero codFicFmd ; @ R110FIC - pode ser 1@
definir numero tipAdmHfi;  @pode ser 0@
definir numero salEstHsa; @ R038HSA - pode ser 0@
definir numero cplEstHsa; @ R038HSA - pode ser 0@
definir numero xCodEstHsa; @ R076DES  - pode ser 1 @



definir alfa aEmiCar; @ valor = "N" @
definir alfa aCodCcu; @ 1401 Recursos Humanos @ 
definir alfa aApeFun; @ Valor = "AP" @


definir data dDatInc; @ pode ser a data de hoje  @

@------------------------------------------------------------------------------@

aMsgRet = "";

nQtd = 0;

se(nQtd < 1) { 
                                                                                                      
  RetornarMaiorNumCad();                                                        @Chamada de Função@
  DefineValores();                                                              @Chamada de Função@
  PreencheVazios();                                                             @Chamada de Função@
  
  TamanhoAlfa(aNomFun, vTam);
  
  se (vTam < 6){
    xCodErr = 1;
    aMsgRet = "O nome precisa ter 6 ou mais caracteres!";
    RetornaWebService();                                                        @Chamada de Função@
  } senao se ((aTipSex <> "M") e (aTipSex <> "F")){
    xCodErr = 1;
    aMsgRet = "Digite M para Masculino e F para Feminino";
    RetornaWebService();                                                        @Chamada de Função@
  } senao se ((aPerPag <> "M") e (aPerPag <> "S") e (aPerPag <> "Q")){
    xCodErr = 1;
    aMsgRet = "Digite M para Mensal, S para Semanal e Q para Quinzenal";
    RetornaWebService();                                                        @Chamada de Função@
  } senao se ((aCotDef <> "S") e (aCotDef <> "N")){
    xCodErr = 1;
    aMsgRet = "Digite S para sim ou N para não para portador de deficiência.";
    RetornaWebService();                                                        @Chamada de Função@
  } senao se ((aVerInt <> "A") e (aVerInt <> "B") e (aVerInt <> "I")){
    xCodErr = 1;
    aMsgRet = "Digite A para alertar, B para bloquear ou I para ignorar.";
    RetornaWebService();                                                        @Chamada de Função@
  } senao {
     
    IniciarTransacao();
    ExecSQLEx("insert into USU_T_Omega                                         \
                 (USU_NumEmp, USU_TipCol, USU_NumCad, USU_Academia, USU_NomFun,\ 
                 USU_DatAdm, USU_CodTap, USU_SitAfa, USU_CodEsc, USU_TipCon,   \
                 USU_TipSex, USU_EstCiv, USU_GraIns, USU_DatNas, USU_CodNac,   \
                 USU_PerPag, USU_EmiCar, USU_CotDef, USU_ConRho, USU_VerInt,   \
                 USU_EstCar, USU_CodCar, USU_EstPos, USU_PosTra, USU_CodFil,   \
                 USU_TabOrg, USU_NumLoc, USU_CodCcu)                           \
               values                                                          \
                 (1, 1, :xNumCad, 1, :aNomFun, :dDatAdm, 1, 1, 1, :xTipCon,    \ 
                 :aTipSex, :xEstCiv, :xGraIns, :dDatNas, :xCodNac, :aPerPag,   \
                 'N', :aCotDef, :xConRho, :aVerInt, :xEstCar, :aCodCar,   \
                 :xEstPos, :aPosTra, :xCodFil, :xTabOrg, :xNumLoc, :aCodCcu)"
             , xCodErr, aMsgRet);
    
    se(xCodErr = 0) {                                                           
      FinalizarTransacao();
      aMsgRet = "Funcionário inserido com sucesso!";
    } senao {
      DesfazerTransacao();
      aMsgRet = "Falha ao inserir funcionário...";
    }

    RetornaWebService();                                                        @Chamada de Função@
  }                                                            

  nQtd++;                                                                       
}

@------------------------------------------------------------------------------@           
    
funcao RetornarMaiorNumCad(); {                                                 @@
  definir cursor c_usu_t_omega;
  
  c_usu_t_omega.SQL "select usu_numcad from usu_t_omega where 0 = 1 union      \
                     select max(usu_numcad) from usu_t_omega                   \
                      where usu_numcad < 2000";                                
  
  c_usu_t_omega.AbrirCursor();
  
  se (c_usu_t_omega.Achou)
    xNumCad = c_usu_t_omega.usu_numcad + 1;
  senao
    xNumCad = 1000;
  
  c_usu_t_omega.FecharCursor();
}    
    
funcao DefineValores(); {                                                       @Define valores para as variáveis@
  @Variáveis numéricas@
  xTipCon = InsereFuncionario.contrato;
  xEstCiv = InsereFuncionario.estadoCivil;
  xGraIns = InsereFuncionario.instrucao;
  xCodNac = InsereFuncionario.nacionalidade;
  xConRho = InsereFuncionario.contadorRonda;
  xEstCar = InsereFuncionario.estruturaCargo;
  xCodFil = InsereFuncionario.filial;
  xTabOrg = InsereFuncionario.organograma;
  xNumLoc = InsereFuncionario.localOrganograma;

  @Variáveis alfanuméricas@  
  aNomFun = InsereFuncionario.funcionario;                               
  aTipSex = InsereFuncionario.sexo;
  aPerPag = InsereFuncionario.periodoPagamento;
  aCotDef = InsereFuncionario.deficiencia;
  aVerInt = InsereFuncionario.interjornada;
  aCodCar = InsereFuncionario.cargo;
  aPosTra = InsereFuncionario.posto;
  aCodCcu = InsereFuncionario.centroCusto;
  
  @Variáveis do tipo data@
  dDatAdm = InsereFuncionario.admissao;                                  
  dDatNas = InsereFuncionario.nascimento;

  VariaveisValorFixo();
}
                                              
funcao PreencheVazios(); {                                                      
  se((xTipCon < 1) ou (xTipCon > 13))                 
    xTipCon = 1; @Trabalhando@

  se((xEstCiv < 1) ou (xEstCiv > 9) ou (xEstCiv = 8)) 
    xEstCiv = 1; @Solteiro@

  se ((xConRho < 1) ou (xConRho > 4))                 
    xConRho = 1; @Solteiro@
}
                                                                                
funcao RetornaWebService(); {      
  InsereFuncionario.retorno.CriarLinha();                                       @Define os valores dos parâmetros de saída@
  InsereFuncionario.retorno.codRet = xCodErr;
  InsereFuncionario.retorno.msgRet = aMsgRet;
}

funcao VariaveisValorFixo();{

  xNumEmp = 1; 
  xTipCol = 1; 
  xAcademia = 1; 
  xCodTap = 1; 
  xSitAfa = 1; 
  xCodEsc = 1; 
  xTabOrg = 1; 
  xRacCor = 15; 
  xCodMotHsa = 1; 
  xCodTmaHes = 1;

  codFicFmd = 1; 
  tipAdmHfi = 0; 
  salEstHsa = 0; 
  cplEstHsa = 0; 
  xCodEstHsa = 1; 

  aEmiCar = "N";  
  aCodCcu = "1401";
  aApeFun = "AP" ;

  DataHoje(dDatInc);
}