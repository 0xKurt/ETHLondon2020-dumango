// dumango

import React from 'react';
import {Button, ButtonGroup} from 'react-bootstrap'

let isFund;

class Profile extends React.Component {

  constructor(props) {
      super(props);
  }

checkFund = () => {
  if(this.props.fundData === 'undefined') {
    isFund = false;
  } else {
    isFund = true;
  }
}

  render() {

    this.checkFund();
  console.log(isFund)

    return (
      <div>
        <center>
          <h3> Profile: </h3>
          <br />
          { !isFund &&
            <ButtonGroup toggle>
            <Button onClick={this.props.setupButton} variant="light" size ="lg">Set up new Fund</Button>
          </ButtonGroup>}
          { isFund &&
            <p>
              <h5>Fund Data: </h5>
              <table>
              <tr>
                <td><b>current age: </b></td>
                <td>{this.props.fundData.currentAge}</td>
              </tr>
              <tr>
                <td><b>age at pension: </b></td>
                <td>{this.props.fundData.pensionAge}</td>
              </tr>
              <tr>
                <td><b>years until pension: </b></td>
                <td>{this.props.fundData.ageDiff}</td>
              </tr>
              <tr>
                <td><b>monthly amount: </b></td>
                <td>{this.props.fundData.amount}</td>
              </tr>
              <tr>
                <td><b>monthly pension: </b></td>
                <td>{this.props.fundData.pension}</td>
              </tr>
              </table>
            </p>}
          <br /> <br />
          <ButtonGroup toggle>
            <Button onClick={this.props.managerButton} variant="light" size ="lg">Manage Fund</Button>
          </ButtonGroup>
        </center>
      </div>
    );
  }
}
export default Profile;
