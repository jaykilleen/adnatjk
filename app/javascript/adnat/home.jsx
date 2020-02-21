import React from 'react'
import Clock from './components/clock'
import Shifts from './shifts/shifts'

class Home extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div className="container mx-auto">
  <h1 className="text-6xl">Hello, world!!</h1>
        <Clock />
        <Shifts />
      </div>
    );
  }
}

export default Home;