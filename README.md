# Projeto-Consultoria
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

![image](https://user-images.githubusercontent.com/44294260/185628327-f6ca331f-99af-42f6-b991-66fc4b8a417a.png)

**Resultado:**
![image](https://user-images.githubusercontent.com/44294260/185628204-652f4c41-7d27-429b-9b0a-989c222fa164.png)


Veja <a href="https://github.com/TCC-Operacional/Projeto-Consultoria/blob/main/Codigos/relatorio.lsp">aqui</a> o código criado na **Seção Detalhe_1, Antes de imprimir**.
<br>

### Tela SGI

Em gestão de Pessoas 

recursos → gerador de telas

**Interface, formulário e ação criados**

![image](https://user-images.githubusercontent.com/44294260/185626951-3a0f7983-afa3-42c6-93fe-72eed8f389e9.png)

![image](https://user-images.githubusercontent.com/44294260/185627260-f324b576-b4ad-4d7a-8236-99b795a37d27.png)

![image](https://user-images.githubusercontent.com/44294260/185627491-5425f247-85d9-48c7-a2a8-24c311414989.png)

**Em *Regras* da tabela Omega:**

```
ExecutaRelatorio("FPRE188.COL", "N");
```

**Em  Formulários X-Window:**

![image](https://user-images.githubusercontent.com/44294260/185627757-5e77e903-be42-4644-88a6-fd6c2cd01e69.png)

![image](https://user-images.githubusercontent.com/44294260/185628073-e2e72942-e62b-4c90-bfae-78655ea40af6.png)




