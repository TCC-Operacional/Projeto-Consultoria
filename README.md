# Projeto-Consultoria

## Problemas de case 

 ​ A Ômega foi contratada pela Lobtec para criar um processo de cadastro de colaboradores da empresa. Já existe uma tabela no banco de dados para inserir os novos colaboradores, mas foi proposta a criação de uma nova para cadastrar em ambas e ter um relatório de verificação de consistência dos registros. Mas não era apenas necessário inserir um colaborador. Deveria haver uma tela para poder editar e excluir os registros na nossa tabela e nela acessar o relatório de consistência criado.

 ​	Assim, foi criado um cadastro pelo BPM na SeniorX Platform, um WebService que insere o registro nas tabelas, uma tela de edição e exclusão dos registros que pode ser acessada no Menu Personalizadas do G5 e o relatório de Consistência.



### Projeto criado para organizar os arquivos da entrega do TCC da Academia Lobtec.

<h4>Fluxo de Desenvolvimento</h4>

* <i>Criação de um formulário para cadastro do colaborador através do BPM;</i>
* Criação de uma tabela do nosso grupo no CDBS que espelha a R034FUN com os campos obrigatórios e com o nome personalizado: USU_T_Omega;
  - adição de novo campo com enumerador para diferenciar nossos registros inseridos na R034FUN dos de outros grupos: USU_ACADEMIA, inserindo os registros com valor 1 neste campo;
  - criação de postos de trabalho (POSTO OMEGA 01 e POSTO OMEGA 02) para personalizar as inserções;
* Criação de um Web Service para cadastrar o novo colaborador na tabela criada;
  - desenvolvimento de lógica para cadastro automático de número de matrícula do colaborador;
  - utilização do Web Service fichaBasica_6 (já existente e não editado por nós) para cadastrar na tabela nativa do sistema (R034FUN);
* Criação de uma tela através do SGI para listar os registros da nova tabela, sendo possível também alterar e deletar;
  - adição de um botão para exibir o relatório;
  - adição da tela ao menu Personalizadas para acesso rápido;
* Desenvolvimento do relatório de Consistência (modelo <b>FPRE188.COL</b>) que lista os dados inseridos na tabela espelhada e na R034FUN;
  - exibição de cabeçalho;
  - listagem de registros inseridos em pelo menos uma das tabelas;
  - coluna com os registros inseridos na R034FUN;
  - coluna com os registros inseridos na USU_T_Omega;
  - coluna que mostra inconsistências nas inserções (caso tenha inserido na tabela espelhada e não na original ou vice-versa);
  - exibição de rodapé com total de registros, total de colaboradores inseridos em cada tabela e o status (Consistente caso esteja em ambas e Inconsistente caso esteja apenas na espelhada); 
* Criação de um hyperlink no Painel de Gestão para exibir o nosso Relatório de Consistência.


## Recursos do projeto


### Banco de dados 

**Tabela Espelhada:** USU_T_Omega


### WebService

**Modulo Rubi** Recursos → Implementações → editor webservice

​	​	​No Editor de Web Services do Rubi em o projeto será feita no serviço **​com.senior.omega.tcc** em  **Provedor → Interno → ​com.senior.omega.tcc**   

Acesse o código do Web Service <a href="https://github.com/TCC-Operacional/Projeto-Consultoria/blob/main/Codigos/webService.lsp">aqui</a>.



## Postos de Trabalho criados

  * POSTO OMEGA 01 - Empresa = 1, filial = 1
  * POSTO OMEGA 02 - Empresa = 1, filial = 2 

Criando posto de trabalho e as características colocadas para ser o local que a pessoa vai trabalhar, empresa e filial.



### Relatório

![image](https://user-images.githubusercontent.com/61790986/187534847-535c8ab7-f6a0-409c-8e61-87ad09513be5.png)

**Resultado:**

![image](https://user-images.githubusercontent.com/61790986/187534976-c1909001-a542-45e7-8e4f-b13016c0f7be.png)
![image](https://user-images.githubusercontent.com/61790986/187301621-7b7686b5-226d-4a11-95c4-416810896b9f.png)



Veja <a href="https://github.com/TCC-Operacional/Projeto-Consultoria/blob/main/Codigos/relatorio.lsp">aqui</a> o código criado na **Seção Detalhe_1, Antes de imprimir**.
<br>

### Tela SGI

Em gestão de Pessoas 

recursos → gerador de telas

**Interface, formulário e ação criados**

![image](https://user-images.githubusercontent.com/61790986/187301937-087cc1d2-6149-467e-9516-606151da5070.png)

![image](https://user-images.githubusercontent.com/61790986/187302932-439def24-8fa6-4d64-838c-9725a3d04876.png)

Tabela criada na interface com todos os campos da nossa USU_T_Omega.


**Em *Regras* da tabela Omega:**

```
ExecutaRelatorio("FPRE188.COL", "N");
```

**Em  Formulários X-Window:**

![image](https://user-images.githubusercontent.com/61790986/187303093-c33ce475-45e7-452a-9f64-29ff7e9c3d15.png)

**Resultado:**

![image](https://user-images.githubusercontent.com/61790986/187303517-9fda8ef4-5ccf-4522-958c-bc2c44e1facb.png)
![image](https://user-images.githubusercontent.com/61790986/187303570-f4c40a4f-1486-4038-9a97-9ae3b3571b6e.png)


## Painel de Gestão BPM 


<div style="text-align: center">
<p> Primeira tela do BPM </p>
<img src="https://user-images.githubusercontent.com/44294260/187773498-3d30a9e7-455b-4b01-9a7f-18e450207514.png" alt="" width="60%" height="60%">
</div>

### Formulário 

![image](https://user-images.githubusercontent.com/44294260/187775766-c507df60-d15f-4e83-94f7-a0757d1b9c4e.png)

![image](https://user-images.githubusercontent.com/44294260/187775942-fb8390cb-15bf-440a-a8bf-0f9ec166ba57.png)


### Fluxo do BPM

![image](https://user-images.githubusercontent.com/44294260/187776111-fb6e3f43-620a-403e-b1b9-54f0c406ea25.png)

​	No fluxo, primeiramente temos o preenchimento das informações referente ao funcionário que será cadastrado, após concluir será levado a atividade de log que será verificado se as informações estão corretas, podendo concluir a solicitação ou pedir para arrumar a informação com uma mensagem de qual informação ou campo preenchido não está coerente. Caso seja selecionado concluir a atividade da solicitação é finalizada, por consequência e cadastrado o funcionário no sistema HCM  e caso vá para a revisão é retornado para o log para analisar as informações podendo repetir o processo, concluir ou cancelar. 

<img src="https://user-images.githubusercontent.com/44294260/187776198-700fb05d-2246-4ff2-963b-a2e01a19b3d9.png" alt="" width="50%" height="50%">

<img src="https://user-images.githubusercontent.com/44294260/187776412-984ff938-4b5d-4c93-8313-db5ae6130444.png" alt="" width="50%" height="50%">

<img src="https://user-images.githubusercontent.com/44294260/187776615-5993973f-87c0-4eaa-b6ef-70d78bb0de0f.png" alt="" width="50%" height="50%">

#### Em concluir



<img src="https://user-images.githubusercontent.com/44294260/187776973-01eff188-c054-4611-b7b3-71c3bd3a46cc.png" alt="" width="50%" height="50%">

<img src="https://user-images.githubusercontent.com/44294260/187776771-58c2d64f-b340-453b-bd4b-51c5887acdaa.png" alt="" width="50%" height="50%">



### Serviço de integração com o web Service

<img src="https://user-images.githubusercontent.com/44294260/187779925-2518fd81-38d8-47ff-bd17-bf2968f50221.png" alt="" width="70%" height="70%">

<img src="https://user-images.githubusercontent.com/44294260/187779714-10aa685b-e671-4e82-a811-601ab832c9b5.png" alt="" width="70%" height="70%">

![image](https://user-images.githubusercontent.com/44294260/187780532-05a0403b-6132-47e0-bd1c-c8f2f5e6c6ab.png)









