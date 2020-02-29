// dumango

import React from 'react';
import logo from './logo.svg';
import '../App.css';

class Header extends React.Component {

  constructor(props) {
      super(props);
  }

  render() {
    return (
      <div class="header">
      <center>
          <img src={logo} alt="logo" />
          <br />
          <h3><b>PIGL.ETH</b></h3>
          <h5>piggy bank like pension fund</h5>
      </center>
      </div>
    );
  }
}
export default Header;
