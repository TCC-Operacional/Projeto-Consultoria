import Input from './components/Input';
import Select from './components/Select';
import './css/App.css';

import dados from './assets/dados.json'
import { useState } from 'react';
import api from '../src/services/api';

function App() {

  const [NomeColaborador, setNomeColaborador] = useState('');
  const [DataAdmissao, setDataAdmissao] = useState('');
  const [sexo, setSexo] = useState('');
  const [EstadoCivil, setEstadoCivil] = useState('');
  const [DataNascimento, setDataNascimento] = useState('');
  const [GrauInstrucao, setGrauInstrucao] = useState('');
  const [Nacionalidade, setNacionalidade] = useState('');
  const [PeriodoPagamento, setPeriodoPagamento] = useState('');
  const [deficiencia, setDeficiencia] = useState('');
  const [interjornada, setInterjornada] = useState('');
  const [RacaCor, setRacaCor] = useState('');
  const [NumeroCpf, setNumeroCpf] = useState('');
  const [Cargo, setCargo] = useState('');
  const [PostoTrabalho, setPostoTrabalho] = useState('');
  const [DataAlteracaoCcu, setDataAlteracaoCcu] = useState('');
  const [ValorSalario, setValorSalario] = useState('');
  const [ComplementoSalario, setComplementoSalario] = useState('');

  async function handleSubmit() {
    setNomeColaborador(document.getElementById('id-nomfun').value);
    setDataAdmissao(document.getElementById('id-datadm').value);
    setSexo(document.getElementById('id-tipsex').value);
    setEstadoCivil(document.getElementById('id-estciv').value);
    setDataNascimento(document.getElementById('id-datnas').value);
    setGrauInstrucao(document.getElementById('id-grains').value);
    setNacionalidade(document.getElementById('id-codnac').value);
    setPeriodoPagamento(document.getElementById('id-perpag').value);
    setDeficiencia(document.getElementById('id-coddef').value);
    setInterjornada(document.getElementById('id-verint').value);
    setRacaCor(document.getElementById('id-raccor').value);
    setNumeroCpf(document.getElementById('id-numcpf').value);
    setCargo(document.getElementById('id-codcar').value);
    setPostoTrabalho(document.getElementById('id-postra').value);
    setDataAlteracaoCcu(document.getElementById('id-dataltccu').value);
    setValorSalario(document.getElementById('id-valsal').value);
    setComplementoSalario(document.getElementById('id-cplsal').value);
    
    var colaborador = {
      NomeColaborador: NomeColaborador, 
      DataAdmissao: DataAdmissao, 
      sexo: sexo,
      EstadoCivil: EstadoCivil,
      DataNascimento: DataNascimento, 
      GrauInstrucao: GrauInstrucao, 
      Nacionalidade: Nacionalidade, 
      PeriodoPagamento: PeriodoPagamento, 
      deficiencia: deficiencia, 
      interjornada: interjornada, 
      RacaCor: RacaCor, 
      NumeroCpf: NumeroCpf, 
      Cargo: Cargo,
      PostoTrabalho: PostoTrabalho, 
      DataAlteracaoCcu: DataAlteracaoCcu, 
      ValorSalario: ValorSalario, 
      ComplementoSalario: ComplementoSalario
    }

    console.log(colaborador);

    await api.post('/colaborador', colaborador)
      .then(() => alert('Foi!'))
      .catch(err => console.log(err));
  };

  return (
    <div className='App'>
      <header className="App-header">
        <h1>Cadastro de Colaboradores - Ômega</h1>
      </header>

      <section className='App-main-section'>
        <form>
          <div className='div-prof-data'>
            <div className='header-form-section'>
              <h4>Dados profissionais</h4>
              <hr/>
            </div>

            <Input titulo='Nome' type='text' id='id-nomfun' name='nomfun' classe='div-input' />
            <Select titulo='Sexo' type='text' id='id-tipsex' name='tipsex' classe='div-select div-3' itens={dados.tipsex} />
            <Input titulo='Data de Nascimento' type='date' id='id-datnas' classe='div-input div-3' />
            <Select titulo='Estado Civil' type='text' id='id-estciv' name='estciv' classe='div-select div-3' itens={dados.estCiv} />
            <Select titulo='Grau de Instrução' type='text' id='id-grains' name='grains' classe='div-select div-3' itens={dados.graIns} />
            <Select titulo='Nacionalidade' type='text' id='id-codnac' name='codnac' classe='div-select div-3' itens={dados.codNac} />
            <Select titulo='Possui deficiência?' type='text' id='id-coddef' name='coddef' classe='div-select div-3' itens={dados.simNao} />
            <Select titulo='Raça/Cor' type='text' id='id-raccor' name='raccor' classe='div-select div-3' itens={dados.racaCor} />
            <Input titulo='CPF' type='text' id='id-numcpf' name='numcpf' classe='div-input div-3' />
          </div>

          <div className='div-pers-data'>
            <div className='header-form-section'>
              <h4>Dados pessoais</h4>
              <hr/>
            </div>
          
            <Input titulo='Data de Admissão' type='date' id='id-datadm' name='datadm' classe='div-input div-3' />
            <Input titulo='Data Alteração Centro de Custo' type='date' id='id-dataltccu' name='dataltccu' classe='div-input div-3' />
            <Select titulo='Período de Pagamento' type='text' id='id-perpag' name='perpag' classe='div-select div-3' itens={dados.perPag} />
            <Select titulo='Cargo' id='id-codcar' type='text' name='codcar' classe='div-select div-3' itens={dados.codCar} />
            <Select titulo='Posto de Trabalho' type='text' id='id-postra' name='postra' classe='div-select div-3' itens={dados.posTra} />
            <Input titulo='Salário' type='number' id='id-valsal' name='valsal' classe='div-input div-3' />
            <Input titulo='Complemento do Salário' type='number' id='id-cplsal' name='cplsal' classe='div-input div-3' />
            <Select titulo='Interjornada' type='text' id='id-verint' name='verint' classe='div-select div-3' itens={dados.verInt} />
          </div>

          <div className='div-actions'>
            <button  type='button' onClick={handleSubmit} className='btn-submit'>Cadastrar</button>
            <input type='reset' value='Limpar campos' className='input-reset' />
          </div>
        </form>
      </section>
    </div>
  );
}

export default App;
