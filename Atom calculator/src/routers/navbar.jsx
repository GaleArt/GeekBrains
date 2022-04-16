import { Link, Outlet } from 'react-router-dom';
import './navigation.css'

const Navigation = () => {
  return (
    <>
    <header>
      <nav className='icons'>
      <Link to="/"><img src="./icons/home.png" title="домашняя"/></Link>
      <Link to="/examples"><img src="./icons/examples.png" title="примеры"/></Link>
      <Link to="/weather"><img src="./icons/weather.png" title="погода"/></Link>
      <Link to="/finance"><img src="./icons/finance.png" title="финансы"/></Link>
      <Link to="/todo"><img src="./icons/todo.png" title="задачи"/></Link>
      <Link to="/personal"><img src="./icons/personal.png" title="персонал"/></Link>
      <Link to="/calculators"><img src="./icons/calculators.png" title="калькуляторы"/></Link>
      </nav>
    </header>
    <Outlet />
    </>
  )
}

export {Navigation};
