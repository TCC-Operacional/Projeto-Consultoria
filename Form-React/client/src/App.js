import Input from './components/Input';
import Select from './components/Select';
import './css/App.css';

import dados from './assets/dados.json';
import api from '../src/services/api';
import { toast } from 'react-toastify';
import { useState } from 'react';

function App() {

  const [loading, setLoading] = useState(false);

  async function handleSubmit() {
    let NomeColaborador = document.getElementById('id-nomfun').value;
    let DataAdmissao = document.getElementById('id-datadm').value;
    let Sexo = document.getElementById('id-tipsex').value;
    let EstadoCivil = document.getElementById('id-estciv').value;
    let DataNascimento = document.getElementById('id-datnas').value;
    let GrauInstrucao = document.getElementById('id-grains').value;
    let Nacionalidade = document.getElementById('id-codnac').value;
    let PeriodoPagamento = document.getElementById('id-perpag').value;
    let Deficiencia = document.getElementById('id-coddef').value;
    let Interjornada = document.getElementById('id-verint').value;
    let RacaCor = document.getElementById('id-raccor').value;
    let NumeroCpf = document.getElementById('id-numcpf').value;
    let Cargo = document.getElementById('id-codcar').value;
    let PostoTrabalho = document.getElementById('id-postra').value;
    let DataAlteracaoCcu = document.getElementById('id-dataltccu').value;
    let ValorSalario = document.getElementById('id-valsal').value;
    let ComplementoSalario = document.getElementById('id-cplsal').value;
    
    let datadm = new Date(DataAdmissao);
    datadm.setDate(datadm.getDate() + 1)
    datadm = datadm.toLocaleDateString();
    
    let datnas = new Date(DataNascimento);
    datnas.setDate(datnas.getDate() + 1)
    datnas = datnas.toLocaleDateString();
    
    let datalt = new Date(DataAlteracaoCcu);
    datalt.setDate(datalt.getDate() + 1)
    datalt = datalt.toLocaleDateString();
    
    const colaborador = {
      nomeColaborador: NomeColaborador, 
      dataAdmissao: datadm, 
      sexo: Sexo,
      estadoCivil: EstadoCivil,
      dataNascimento: datadm, 
      grauInstrucao: GrauInstrucao, 
      nacionalidade: Nacionalidade, 
      periodoPagamento: PeriodoPagamento, 
      deficiencia: Deficiencia, 
      interjornada: Interjornada, 
      racaCor: RacaCor, 
      numeroCpf: NumeroCpf, 
      cargo: Cargo,
      postoTrabalho: PostoTrabalho, 
      dataAlteracaoCcu: datalt, 
      valorSalario: ValorSalario, 
      complementoSalario: ComplementoSalario
    }

    setLoading(true);

    await api.post('/colaborador', colaborador)
      .then((retorno) => {
        if(retorno.data.aviso !== undefined) {
          toast.warn(retorno.data.aviso);
        } else {
          // document.getElementById('id-input-reset').click();
          // var form = document.getElementById('id-form');
          // var inputs = form.querySelectAll('input');
          // for (var i = 0; i < inputs.length; i++) {
          //   inputs[i].value = '';
          // }
          toast.success('Colaborador cadastrado com sucesso!');
        }
        setLoading(false);
      })
      .catch(err => console.log('erro', err));
  };

  return (
    <div className='App'>
      {/* <header className="App-header"> */}
      <header>
        <h1>Cadastro de Colaboradores - Ômega</h1>
      </header>
      <section>
        <form id='id-form'>
          <div className='div-pers-data'>
            <div className='header-form-section'>
            <h4>Dados pessoais</h4>
              <hr/>
            </div>

            <div className='div-infos'>
              <Input titulo='Nome' type='text' id='id-nomfun' name='nomfun' 
                classe='div-input div-10' required />
              <Select titulo='Sexo' type='text' id='id-tipsex' name='tipsex' 
                classe='div-select div-3' itens={dados.tipsex} required />
              <Input titulo='Data de Nascimento' type='date' id='id-datnas' 
                classe='div-input div-3' />
              <Select titulo='Estado Civil' type='text' id='id-estciv' name='estciv' 
                classe='div-select div-3' itens={dados.estCiv} required />
              <Select titulo='Grau de Instrução' type='text' id='id-grains' name='grains' 
                classe='div-select div-3' itens={dados.graIns} required />
              <Select titulo='Nacionalidade' type='text' id='id-codnac' name='codnac' 
                classe='div-select div-3' itens={dados.codNac} required />
              <Select titulo='Possui deficiência?' type='text' id='id-coddef' name='coddef' 
                classe='div-select div-3' itens={dados.simNao} required />
              <Select titulo='Raça/Cor' type='text' id='id-raccor' name='raccor' 
                classe='div-select div-3' itens={dados.racaCor} required />
              <Input titulo='CPF' type='text' id='id-numcpf' name='numcpf' 
                classe='div-input div-3' required />
            </div>
          </div>

          <div className='div-prof-data'>
            <div className='header-form-section'>
              <h4>Dados profissionais</h4>
              <hr/>
            </div>
          
            <div className='div-infos'>
              <Input titulo='Data de Admissão' type='date' id='id-datadm' name='datadm' 
                classe='div-input div-3' required />
              <Input titulo='Data Alteração Centro de Custo' type='date' id='id-dataltccu' name='dataltccu' 
                classe='div-input div-3' required />
              <Select titulo='Período de Pagamento' type='text' id='id-perpag' name='perpag' 
                classe='div-select div-3' itens={dados.perPag} required />
              <Select titulo='Cargo' id='id-codcar' type='text' name='codcar' 
                classe='div-select div-3' itens={dados.codCar} required />
              <Select titulo='Posto de Trabalho' type='text' id='id-postra' name='postra' 
                classe='div-select div-3' itens={dados.posTra} required />
              <Input titulo='Salário' type='number' id='id-valsal' name='valsal' 
                classe='div-input div-3' required />
              <Input titulo='Complemento do Salário' type='number' id='id-cplsal' name='cplsal' 
                classe='div-input div-3' required />
              <Select titulo='Interjornada' type='text' id='id-verint' name='verint' 
                classe='div-select div-3' itens={dados.verInt} required />
            </div>
          </div>
          
          {loading && <img src='./assets/loading.gif' alt='Carregando...' /> }

          <div className='div-actions'>
            <button type='button' onClick={handleSubmit} className='btn-submit'>Cadastrar</button>
            <input type='reset' value='Limpar campos' className='input-reset' id='id-input-reset' />
          </div>
        </form>
      </section>

      <footer>
        <p>
          <span title='demetrio_atra@lobtec.com.br'>Demétrio Atra</span> | <span title='douglas_teles@lobtec.com.br'>Douglas Teles</span> | <span title='giovanna_leiva@lobtec.com.br'>Giovanna Leiva</span>
        </p> 
        <p className='omega-reg'>Ômega&reg; 2022</p>
      </footer>
    </div>
  );
}

export default App;
