import React, { useState } from "react";

export default function Input(props) {
  const [valor, setValor] = useState('');
  const { type, id, titulo, name, classe } = props;

  return (
    <div className={classe}>
      <label htmlFor={id}>{titulo}</label>
      <input type={type} name={name} id={id}
        value={valor} onChange={e => setValor(e.target.value) } />
    </div>
  );
}