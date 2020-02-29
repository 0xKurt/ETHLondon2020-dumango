// dumango

import React from 'react';
import logo from './logo.svg';

class Header extends React.Component {

  constructor(props) {
      super(props);
  }

  render() {
    return (
      <div>
      <center>
          <img src={logo} alt="logo" />
          <br />
          pigleth - piggy bank like pension fund
      </center>
      </div>
    );
  }
}
export default Header;
