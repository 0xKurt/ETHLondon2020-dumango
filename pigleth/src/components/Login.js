// dumango

import React from 'react';
import {Button, ButtonGroup} from 'react-bootstrap'

import Web3 from 'web3';

class Login extends React.Component {

  constructor(props) {
      super(props);
  }
  render() {
    return (
      <div>
        <center>
          <h3> Login: </h3>
          <br />
          <ButtonGroup toggle>
            <Button onClick={this.props.metamaskButton} variant="primary" size ="lg">Metamask</Button>
          </ButtonGroup>
          <br /> <br />
          <ButtonGroup toggle>
            <Button onClick={this.props.torusButton} variant="primary" size ="lg">Torus</Button>
          </ButtonGroup>
        </center>
      </div>
    );
  }
}
export default Login;
