import logo from './logo.svg';
import './App.css';
import About from './Components/About';
import Home from './Components/Home';
import Contact from './Components/Contact';

function App() {
  return (
    <div className="App">
      <h1>Welcome to first session of react</h1>
      <Home/>
      <About/>
      <Contact/>
    </div>
  );
}

export default App;
