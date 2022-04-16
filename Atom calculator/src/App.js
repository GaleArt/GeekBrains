import { Routes, Route, Link } from 'react-router-dom';

import { Home } from './components/home/home';
import { Calendar } from './components/calendar/calendar';
import { Notfound } from './components/notfound';
import { Layout } from './routers/Layout';

import './App.css';

function App() {
  return (
    <>
      <Routes>
        <Route path="/" element={<Layout />}>
        <Route index element={<Home />} />
        <Route path="calendar" element={<Calendar />} />
        <Route path="*" element={<Notfound />} />
        </Route>
      </Routes>
    </>
  );
}

export default App;
