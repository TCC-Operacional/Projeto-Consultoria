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
  
