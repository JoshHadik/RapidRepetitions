import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import { BrowserRouter as Router, Route, Link } from 'react-router-dom';
import Main from './Main.js';
import About from './About.js';
import Story from './Story.js';

class App extends Component {
  render() {
    return (
      <Router>
        <div className="App">
          <header className="App-header">
            <img src={logo} className="App-logo" alt="logo" />
            <h1> Monkey Space Race </h1>
            <p> A Rapid Repetition </p>
            <nav className="App-nav">
              <Link to="/" className="App-link">Main</Link>
              <Link to="/about" className="App-link">About</Link>
              <Link to="/story" className="App-link">Story</Link>
            </nav>
          </header>
          <section className="App-page">
            <Route exact path="/" component={Main} />
            <Route path="/about" component={About} />
            <Route path="/story" component={Story} />
          </section>
        </div>
      </Router>
    );
  }
}

export default App;
