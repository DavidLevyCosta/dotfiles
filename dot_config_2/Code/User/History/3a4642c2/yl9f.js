import React, { useState } from 'react';
import '../styles/Register.css'; // Certifique-se de que o caminho está correto

import '../api/UsersService'


function Register() {



  return (
    <div className="register-container">
      <div className="register-card">
        <h2 className="form-title">Cadastro</h2>
        <form className="register-form">
          <div className="form-group two-thirds">
            <input type="text" id="fullName" name="fullName" placeholder="Nome Completo" required />
          </div>
          <div className="form-group">
            <input type="text" id="cpf" name="cpf" placeholder="CPF" required />
          </div>
          <div className="form-group one-third">
            <input type="tel" id="phone" name="phone" placeholder="Telefone" required />
          </div>
          <div className="form-group full-width">
            <input type="email" id="email" name="email" placeholder="Email" required />
          </div>
            <div className="form-group full-width">
                <div className="password-container">
                    <input type="password" id="password" name="password" placeholder="Senha" required />
                    <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirmar Senha" required />
                </div>
            </div>
          <div className="form-group full-width">
            <input type="text" id="antiPhishing" name="antiPhishing" placeholder="Código Anti-Phishing" required />
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
