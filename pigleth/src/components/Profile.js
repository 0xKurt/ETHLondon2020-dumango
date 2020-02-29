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
            <Button onClick={this.props.setupButton} variant="primary" size ="lg">Set up new Fund</Button>
          </ButtonGroup>}
          { isFund && <p>{this.props.fundData.pension}</p>}
          <br /> <br />
          <ButtonGroup toggle>
            <Button onClick={this.props.managerButton} variant="primary" size ="lg">Manage Fund</Button>
          </ButtonGroup>
        </center>
      </div>
    );
  }
}
export default Profile;
