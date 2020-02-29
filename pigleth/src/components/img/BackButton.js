// dumango

import React, { Component } from 'react';
import {Button, ButtonGroup} from 'react-bootstrap'

class BackButton extends Component {

  onClickHandler() {

  }

  render() {
    return (
      <div class="backButton">
        <ButtonGroup>
          <Button onClick={this.onClickHandler} variant="light" size ="lg">Back</Button>
        </ButtonGroup>
      </div>
    );
  }
}
export default BackButton;
