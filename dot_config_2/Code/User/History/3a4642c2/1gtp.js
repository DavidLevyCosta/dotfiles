import React, { useState } from 'react';
import '../styles/Register.css'; // Certifique-se de que o caminho está correto

import '../api/UsersService'
import { saveUser } from '../api/UsersService';


function Register() {

  const [values, setValues] = useState({
    nome: '',
    cpf: '',
    telefone: '',
    email: '',
    senha: '',
    conf_senha: '',
    anti_phishing: '',
  });

  const handleNewUser = async (event) => {
    event.preventDefault();
    try {
      const response = await saveUser(values);
      console.log(response);
    } catch(error) {
      console.log(error);
    }
  }

  const onChange = (event) => {
    setValues({ ...values, [event.target.name]: event.target.value});
    console.log(values);
  }

  return (
    <div className="register-container">
      <div className="register-card">
        <h2 className="form-title">Cadastro</h2>
        <form onSubmit={handleNewUser} className="register-form">
          <div className="form-group two-thirds">
            <input type="text" value={values.nome} onChange={onChange} id="nome" name="nome" placeholder="Nome Completo" required />
          </div>
          <div className="form-group one-third">
            <input type="text" value={values.cpf} onChange={onChange} id="cpf" name="cpf" placeholder="CPF" required />
          </div>
          <div className="form-group full-width">
            <input type="tel" value={values.telefone} onChange={onChange} id="telefone" name="telefone" placeholder="Telefone" required />
          </div>
          <div className="form-group full-width">
            <input type="email" value={values.email} onChange={onChange} id="email" name="email" placeholder="Email" required />
          </div>
            <div className="form-group full-width">
                <div className="password-container">
                    <input type="password" value={values.senha} onChange={onChange} id="senha" name="senha" placeholder="Senha" required />
                    <input type="password" value={values.conf_senha} onChange={onChange} id="conf_senha" name="conf_senha" placeholder="Confirmar Senha" required />
                </div>
            </div>
          <div className="form-group full-width">
            <input type="text" value={values.anti_phishing} onChange={onChange} id="anti_phishing" name="anti_phishing" placeholder="Código Anti-Phishing" required />
            <a href="/what-is-antiphishing" className="info-link">O que é isso?</a>
          </div>
          <button type="submit" className="submit-button">Cadastrar</button>
          <a href="/help" className="info-link">Não consigo criar uma conta!</a>
        </form>
      </div>
    </div>
  );
}

export default Register;
