import React, { useState } from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Header from './components/Header';
import Register from './components/Register';
import Login from './components/Login';
import HomePage from './components/HomePage';
import Wallet from './components/Wallet';

function App() {
  const [data, setData] = useState({});
  return (
    <Router>
      <Header />
      <div className="container" style={{backgroundColor: '#fbfada'}}>
        <Routes>
          <Route path="/register" element={<Register />} />
          <Route path="/login" element={<Login />} />
          <Route path="/homepage" element={<HomePage />} />
          <Route path="/wallet" element={<Wallet />} />
        </Routes>
      </div>
    </Router>
  );
}

export default App;
