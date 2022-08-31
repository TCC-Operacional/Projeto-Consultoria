import React, { useState } from "react";

export default function Select(props) {
  const [valor, setValor] = useState('');
  const { type, id, titulo, name, classe, itens } = props;

  return (
    <div className={classe}>
      <label htmlFor={id}>{titulo}</label>
      <select type={type} name={name} id={id}
        value={valor} onChange={e => setValor(e.target.value)}
      >
        <option></option>
        {itens.map(i => {
          return <option key={itens.indexOf(i)+i}>{i}</option>
        })}
      </select>
    </div>
  );
}