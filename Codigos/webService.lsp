@---- Webservice ----@
definir interno.com.senior.g5.rh.fp.fichaBasica.FichaBasica_6 fichaBasica;

@---- Funções ----@
definir funcao VariaveisValorFixo();
definir funcao DefineValores();
definir funcao RetornarMaiorNumCad();                                                 
definir funcao AssociarValores();   
definir funcao RetornaWebService();
definir funcao ValidarEntrada();
definir funcao PostodeTrabalho();
definir funcao CadastroFichaBasica();
definir funcao VerificarCadastroR034FUN();

@---- Parâmetros de entrada e saída ----@
definir numero xNumCad;
definir numero xTipCon;    
definir numero xEstCiv;    
definir numero xGraIns;    
definir numero xCodNac;    
definir numero xConRho;    
definir numero xEstCar;    
definir numero xCodFil;    
definir numero xCatEso;    
definir numero xCodEtb;    
definir numero xRacCor;    
definir numero xCatSef;    
definir numero xValSalHsa; 
definir numero xCplSalHsa; 
definir numero xApuPonApu;  
definir numero xTipSalHsa; 
definir numero xCodErr; 
definir numero xCodErrFicha;

definir alfa aNomFun;                                                                           
definir alfa aTipSex;     
definir alfa aPerPag; 
definir alfa aCotDef;
definir alfa aVerInt;
definir alfa aCodCar;
definir alfa aPosTra;      
definir alfa aTipOpc;      
definir alfa aModPag;      
definir alfa aRecAdi;      
definir alfa aPagSin;      
definir alfa aNumCpf;      
definir alfa aEstadoCivil;
definir alfa aGrauInstrucao;
definir alfa aNacionalidade;
definir alfa aRacaCor;
definir alfa aMsgRet;
definir alfa aMsgRetFicha;
definir alfa aResult;

definir data dDatAdm; 
definir data dDatNas;      
definir data dDatAltCcu;   
                           
@---- Variáveis com valores fixos ----@
definir numero xNumEmp;    
definir numero xEstPos;     
definir numero xTipCol;   
definir numero xAcademia;  
definir numero xCodTap;    
definir numero xSitAfa;    
definir numero xCodEsc;    
definir numero xTabOrg;   
definir numero xCodMotHsa; 
definir numero xCodTmaHes; 
definir numero xNumLoc;    
definir numero xTipAdmHfi; 
definir numero xSalEstHsa; 
definir numero xCplEstHsa; 
definir numero xCodEstHsa; 
definir numero xCodVinHvi; 
definir numero xIndAdm;    
definir numero aCodSinHsi;

definir alfa aEmiCar;      
definir alfa aCodCcu;      
definir alfa aApeFun;     
definir alfa aRec13s;      
definir alfa aLisRai;     
definir alfa aCodFicFmd ;  
definir alfa aNumLoc;    
definir alfa aHorInc;    

definir data dDatInc;      
definir data dDatOpc;     
definir data dDataAlt;

@--------------------------------- Main ---------------------------------------@

xCodErr = 0;
aMsgRetFicha = "";
xCodErrFicha = 0;
                                                                        
@--- Define número de cadastro para o colaborador ---@                                                                        
RetornarMaiorNumCad();

@--- Define valores fixos para praticidade da apresentação ---@  
VariaveisValorFixo();                                                          

@--- Guarda os valores do formulário ---@  
DefineValores();                                                                

@--- Define filial para o colaborador ---@  
PostodeTrabalho();  

@--- Guarda valores do formulário em códigos ---@                                           
AssociarValores();    

@--- Valida dados necessários para cadastro ---@                                                           
ValidarEntrada();  
  
se(aMsgRet = "") {

  @--- Cadastra colaborador na tabela R034FUN ---@
  CadastroFichaBasica();
  
  @--- Verifica se o primeiro cadastro foi realizado ---@
  VerificarCadastroR034FUN();                                                       

  se((xCodErrFicha = 0) e (aMsgRet = "")) {

    @ Atualiza o código da academia para o colaborador inserido @
    IniciarTransacao();   
    ExecSQL "UPDATE R034FUN set usu_academia = 1                               \
              WHERE numcad = :xNumCad                                          \
                AND numemp = :xNumEmp                                          \
                AND tipcol = :xTipCol";
    FinalizarTransacao(); 
    
    @ Cadastra colaborador na tabela USU_T_Omega @
    IniciarTransacao();
    ExecSQLEx("insert into USU_T_Omega                                         \
                  (USU_NumEmp, USU_TipCol, USU_NumCad, USU_Academia,           \
                   USU_NomFun, USU_DatAdm, USU_CodTap, USU_SitAfa, USU_CodEsc, \
                   USU_TipCon, USU_TipSex, USU_EstCiv, USU_GraIns, USU_DatNas, \
                   USU_CodNac, USU_PerPag, USU_EmiCar, USU_CotDef, USU_ConRho, \
                   USU_VerInt, USU_EstCar, USU_CodCar, USU_EstPos, USU_PosTra, \
                   USU_CodFil, USU_TabOrg, USU_NumLoc, USU_CodCcu, USU_CatEso, \
                   USU_CodEtb, USU_TipAdm, USU_TipOpc, USU_DatOpc, USU_ModPag, \
                   USU_RecAdi, USU_Rec13s, USU_LisRai, USU_RacCor, USU_CatSef, \
                   USU_PagSin, USU_ApeFun, USU_NumCpf, USU_CodEst, USU_ValSal, \
                   USU_CplSal, USU_DatInc, USU_CodVin, USU_CodMot, USU_CodTma) \
                values                                                         \
                  (:xNumEmp, :xTipCol, :xNumCad, 1, :aNomFun, :dDatAdm,        \
                   :xCodTap, :xSitAfa, :xCodEsc, :xTipCon, :aTipSex, :xEstCiv, \
                   :xGraIns, :dDatNas, :xCodNac, :aPerPag, 'N', :aCotDef, 4,   \
                   :aVerInt, :xEstCar, :aCodCar, :xEstPos, :aPosTra, :xCodFil, \			      
                   :xTabOrg, :xNumLoc, :aCodCcu, 9999, :xCodEtb, :xTipAdmHfi,  \
                   :aTipOpc, :dDatOpc, :aModPag, :aRecAdi, :aRec13s, :aLisRai, \
                   :xRacCor, :xCatSef, :aPagSin, :aApeFun, :aNumCpf,           \
                   :xCodEstHsa, :xValSalHsa, :xCplSalHsa, :dDatInc,            \
                   :xCodVinHvi, :xCodMotHsa, :xCodTmaHes)"
              , xCodErr, aMsgRet);
                
    @ Verifica retorno do insert e devolve um código e mensagem para o usuário @
    se(xCodErr = 0) {
      FinalizarTransacao();
      aMsgRet = "Funcionário inserido com sucesso!";
    } senao {
      DesfazerTransacao();
      aMsgRet = "Falha ao inserir funcionário...";
    }
  }
  
  @--- Retorna código e mensagem para o usuário ---@
  RetornaWebService(); 

} senao
  @--- Retorna código e mensagem para o usuário ---@
  RetornaWebService();                                                          

@---------------------------------- Funções -----------------------------------@           
    
@--- Realiza um auto-increment no número de cadastro ---@
funcao RetornarMaiorNumCad(); {                                                 
  definir cursor c_usu_t_omega;
  
  @ Busca maior número de cadastro dentro do range do grupo @
  c_usu_t_omega.SQL "select usu_numcad from usu_t_omega where 0 = 1 union      \
                     select max(usu_numcad) from usu_t_omega                   \
                      where usu_numcad < 2000";                                
  
  c_usu_t_omega.AbrirCursor();
  
  @ Verifica se existe cadastro e define o próximo para o colaborador @
  se(c_usu_t_omega.Achou)
    xNumCad = c_usu_t_omega.usu_numcad + 1;
  senao
    xNumCad = 1000;
  
  c_usu_t_omega.FecharCursor();
}

@--- Define valores fixos para as variáveis obrigatórias ---@
funcao VariaveisValorFixo(); {
  xCodFil = 1;
  xEstPos = 2;
  xNumEmp = 1;
  xTipCol = 1; 
  xAcademia = 1; 
  xCodTap = 1; 
  xSitAfa = 1; 
  xCodEsc = 0003;                     @ 1; @ 
  xTabOrg = 1;   
  xCodMotHsa = 1;                     @ admissao @
  xCodTmaHes = 1;
  xSalEstHsa = 1; 
  xCplEstHsa = 0; 
  xCodEstHsa = 1;
  xCodVinHvi = 10;
  xCatEso = 9999;                     @ 101; @
  xCodEtb = 0;
  xEstCar = 1;
  xIndAdm = 1;
  xCatSef = 1;
  xApuPonApu = 1;
  xTipAdmHfi = 1;
  xTipCon = 1;
  xTipSalHsa = 1;
  xCodSinHsi = 1;
  xConRho = 4;
  
  aNumLoc = "1";                    @ "1.02.01.01"; @
  aCodCcu = "11";                     @ "1499"; @
  aApeFun = "Omega";
  aRec13s = "S";
  aLisRai = "N";
  aTipOpc = "N";
  aModPag = "D";                      @ "R"; @
  aCodFicFmd = "CANCELA";
  aPagSin = "N";
  aRecAdi = "N";
  aCodCar = "00001";
  aEmiCar = "N";
  aHorInc = "12:00";
  
  DataHoje(dDataAlt);
  dDataAlt = dDataAlt + 1;
  dDatInc = dDataAlt;
  dDatOpc = dDataAlt;
}
    
@--- Guarda os parâmetros de entrada ---@
funcao DefineValores(); {                                                       
  aEstadoCivil = InsereFuncionario.EstadoCivil;
  aGrauInstrucao = InsereFuncionario.GrauInstrucao;
  aNacionalidade = InsereFuncionario.Nacionalidade;
  aNumCpf = InsereFuncionario.NumeroCpf;
  xValSalHsa = InsereFuncionario.ValorSalario;
  xCplSalHsa = InsereFuncionario.ComplementoSalario;
  aRacaCor = InsereFuncionario.RacaCor;
  aNomFun = InsereFuncionario.NomeColaborador;                               
  aTipSex = InsereFuncionario.sexo;
  aPerPag = InsereFuncionario.PeriodoPagamento;
  aCotDef = InsereFuncionario.deficiencia;
  aVerInt = InsereFuncionario.interjornada;
  aPosTra = InsereFuncionario.PostoTrabalho;
  aCodCar = InsereFuncionario.Cargo;       
  dDatAdm = InsereFuncionario.DataAdmissao;                            
  dDatNas = InsereFuncionario.DataNascimento;
}

@--- Define a filial de acordo com o posto de trabalho ---@
funcao PostodeTrabalho(); {
  se(aPosTra = "POSTO OMEGA 01") {
    xCodFil = 1;
    xNumLoc = 111;
  } senao se(aPosTra = "POSTO OMEGA 02") {
    xCodFil = 2;
    xNumLoc = 112;
  } senao {
    xCodFil = 1;
    xNumLoc = 111;
    aPosTra = "POSTO OMEGA 01";
  }
}

@--- Associa os valores enviados pelo BPM aos seus valores de banco ---@                                              
funcao AssociarValores(); {

  se(aPerPag <> "") {
    se(aPerPag = "Mensal"){
      aPerPag = "M";
    } senao se(aPerPag = "Semanal"){
      aPerPag = "S";
    } senao se(aPerPag = "Quinzenal"){
      aPerPag = "Q";
    }
  } senao {
    aMsgRet = aMsgRet + " Defina um periodo de Pagamento";
    xCodErr = 1;
  }

  se(aCodCar <> "") {
    se(aCodCar = "Diretor Presidente") {
      aCodCar = "1";
    } senao se(aCodCar = "Gerente Financeiro") {
      aCodCar = "10";
    } senao se(aCodCar = "Auxiliar Administrativo") {
      aCodCar = "11";
    } senao se(aCodCar = "Expedidor") {
      aCodCar = "12";
    } senao se(aCodCar = "Analista financeiro") {
      aCodCar = "13";
    } senao se(aCodCar = "Motorista") {
      aCodCar = "14";
    } senao se(aCodCar = "Contador") {
      aCodCar = "15";
    }
  } senao {
    aMsgRet = aMsgRet + " Defina um Cargo";
    xCodErr = 1;
  }

  se(aVerInt <> "") {
    se(aVerInt = "Alertar") {
      aVerInt = "A";
    } senao se(aVerInt = "Bloquear") {
      aVerInt = "B";
    } senao se(aVerInt = "Ignorar") {
      aVerInt = "I";
    }
  } senao {
    aMsgRet = aMsgRet + " Defina um periodo a Interjornada";
    xCodErr = 1;
  }

  se(aEstadoCivil <> "") {
    se(aEstadoCivil = "Solteiro") {
      xEstCiv = 1;
    } senao se(aEstadoCivil = "Casado") {
      xEstCiv = 2;
    } senao se(aEstadoCivil = "Divorciado") {
      xEstCiv = 3;
    } senao se(aEstadoCivil = "Viúvo") {
      xEstCiv = 4;
    }
  } senao {
    aMsgRet = aMsgRet + " Defina um Estado Civil";
    xCodErr = 1;
  }

  se(aGrauInstrucao <> "") {
    se(aGrauInstrucao = "Analfabeto") {
      xGraIns = 1;
    } senao se(aGrauInstrucao = "1º Grau Completo") {
      xGraIns = 5;
    } senao se(aGrauInstrucao = "2º Grau Incompleto") {
      xGraIns = 6;
    } senao se(aGrauInstrucao = "2º Grau Incompleto") {
      xGraIns = 7;
    } senao se(aGrauInstrucao = "Superior Incompleto") {
      xGraIns = 8;
    } senao se(aGrauInstrucao = "Superior Completo") {
      xGraIns = 9;
    } senao se(aGrauInstrucao = "Pós-Graduação") {
      xGraIns = 10;
    }
  } senao {
    aMsgRet = aMsgRet + " Defina um grau de Instrução";
    xCodErr = 1;
  }

  se(aNacionalidade <> "") {
    se(aNacionalidade = "Brasileiro")
      xCodNac = 10;
    senao se(aNacionalidade = "Brasileiro Naturalizado")
      xCodNac = 20;
    senao se(aNacionalidade = "Argentino")
      xCodNac = 21;
    senao se(aNacionalidade = "Boliviano")
      xCodNac = 22;
    senao se(aNacionalidade = "Chileno")
      xCodNac = 23;
    senao se(aNacionalidade = "Paraguaio")
      xCodNac = 24;
    senao se(aNacionalidade = "Uruguaio")
      xCodNac = 25;
    senao se(aNacionalidade = "Alemão")
      aCodNac = 30;
    senao se(aNacionalidade = "Belga")
      xCodNac = 31;
  } senao {
    aMsgRet = aMsgRet + " Defina um País de origem ";
    xCodErr = 1;
  }

  se(aRacaCor <> "") {
    se(aRacaCor = "Não Informado") {
      xRacCor = 0;
    } senao se(aRacaCor = "Branca") {
      xRacCor = 1;
    } senao se(aRacaCor = "Preta/Negra") {
      xRacCor = 2;
    } senao se(aRacaCor = "Amarela") {
      xRacCor = 3;
    } senao se(aRacaCor = "parda") {
      xRacCor = 4;
    } senao se(aRacaCor = "Indígena") {
      xRacCor = 5;
    }
  } senao {
    aMsgRet = aMsgRet + " Defina a Raça ou cor";
    xCodErr = 1;
  }
}

@--- Retorna mensagem de erro caso a entrada não seja válida ---@
funcao ValidarEntrada(); {
  definir alfa aQuebraLinha;
  
  RetornaAscii(13, aQuebraLinha);

  TamanhoAlfa(aNomFun, vTam);
  se(vTam < 5) {
    xCodErr = 1;
    aMsgRet = "O nome precisa ter 5 ou mais caracteres!";
  } 

  se((aTipSex <> "M") e (aTipSex <> "F")) {
    xCodErr = 1;
    aMsgRet = aMsgRet + aQuebraLinha +
      " Digite M (Masculino) ou F (Feminino) para sexo.";
  } 
  
  se((aPerPag <> "M") e (aPerPag <> "S") e (aPerPag <> "Q")) {
    xCodErr = 1;
    aMsgRet = aMsgRet + aQuebraLinha +
      " M (Mensal), S (Semanal) ou Q (Quinzenal) para período de pagamento.";
  } 
  
  se((aCotDef <> "S") e (aCotDef <> "N")) {
    xCodErr = 1;
    aMsgRet = aMsgRet + aQuebraLinha +
      " Digite S (Sim) ou N (Não) para deficiência.";                  
  } 
  
  se((aVerInt <> "A") e (aVerInt <> "B") e (aVerInt <> "I")) {
    xCodErr = 1;
    aMsgRet = aMsgRet + aQuebraLinha +
      " A (Alertar), B (Bloquear) ou I (Ignorar) para interjornada.";
  }
}

@--- Define os valores dos parâmetros de saída ---@
funcao RetornaWebService(); {      
  InsereFuncionario.retorno.CriarLinha();         
                               
  InsereFuncionario.retorno.codRet = xCodErr;
  InsereFuncionario.retorno.msgRet = aMsgRet;
}

@--- Define os campos do webservice e executa ---@
funcao CadastroFichaBasica(); {
  definir alfa aDataAlt;

  ConverteMascara(3, dDataAlt, aDataAlt, "DD/MM/AAAA");

  fichaBasica.numEmp = xNumEmp; 
  fichaBasica.datAdm = dDatAdm; 
  fichaBasica.sitAfa = xSitAfa; 
  fichaBasica.codCar = aCodCar; 
  fichaBasica.numLoc = aNumLoc;       
  fichaBasica.codEsc = xCodEsc; 
  fichaBasica.codFil = xCodFil; 
  fichaBasica.codCcu = aCodCcu; 
  fichaBasica.pagSin = aPagSin; 
  fichaBasica.codFicFmd = aCodFicFmd; 
  fichaBasica.codTap = xCodTap; 
  fichaBasica.cateSo = xCatEso; 
  fichaBasica.tipOpe = "I"; 
  fichaBasica.codVinHvi = xCodVinHvi; 
  fichaBasica.conRho = xConRho; 
  fichaBasica.posTra = aPosTra; 
  fichaBasica.numCad = xNumCad;  
  fichaBasica.apuPonApu = xApuPonApu; 
  fichaBasica.codTmaHes = xCodTmaHes; 
  fichaBasica.tipAdmHfi = xTipAdmHfi; 
  fichaBasica.nomFun = aNomFun;
  fichaBasica.modPag = aModPag; 
  fichaBasica.motPos = 1; 
  fichaBasica.apeFun = aApeFun; 
  fichaBasica.codSinHsi = 02;
  fichaBasica.socSinHsi = "N"; 
  fichaBasica.posObs = "Omega";
  fichaBasica.tipCon = xTipCon; 
  fichaBasica.tipSalHsa = xTipSalHsa;
  fichaBasica.tipSex = aTipSex; 
  fichaBasica.codEstHsa = xCodEstHsa; 
  fichaBasica.estCiv = xEstCiv; 
  fichaBasica.graIns = xGraIns; 
  fichaBasica.valSalHsa = xValSalHsa; 
  fichaBasica.cplSalHsa = xCplSalHsa; 
  fichaBasica.tipApo = 1 ;           
  fichaBasica.codNac = xCodNac; 
  fichaBasica.recAdi = aRecAdi;  
  fichaBasica.emiCar = aEmiCar; 
  fichaBasica.catSef = xCatSef;
  fichaBasica.datInc = dDatInc;
  fichaBasica.codMotHsa = xCodMotHsa;
  fichaBasica.codMotHca = 1;
  fichaBasica.PerPag = "M";
  fichaBasica.Rec13s = "N";
  fichaBasica.racCor = xRacCor;       

  fichaBasica.ModoExecucao = 1;
  fichaBasica.Executar();
  
  aResult = fichaBasica.erroExecucao;
  InsereFuncionario.ErrorMSG = aResult;
  aMsgRet = aResult;
}

@--- Verifica se o cadastro foi feito pelo webservice fichabasica6 ---@
funcao VerificarCadastroR034FUN(); {
  definir cursor cur_r034fun;
  
  xCodErrFicha = 1;
  cur_r034fun.SQL "select nomfun from r034fun                                  \
                   WHERE numcad = :xNumCad                                     \
                    AND numemp = :xNumEmp                                      \
                    AND tipcol = :xTipCol";

  @ Definir o SQl que  será executado @
  cur_r034fun.AbrirCursor();
 
  @ Verifica se o cargo foi achado para ser atribuido ao valor aTituloCargo @ 
  se(cur_r034fun.achou)
  	xCodErrFicha = 0;
  senao
    aMsgRet = aMsgRet +
      " Falha ao cadastrar!. Cadastro encerrado para evitar inconsistência"; 
	
  cur_r034fun.FecharCursor();
}        