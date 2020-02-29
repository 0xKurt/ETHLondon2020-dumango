// dumango

import React from 'react';
import {Button, ButtonGroup} from 'react-bootstrap'

class Setup extends React.Component {

  constructor(props) {
      super(props);
      this.state = {
        defaultPensionYears: 20,
        currentAge: 0,
        pensionAge: 0,
        ageDiff: 0,
        amount: 0,
        pension: 0
      }
  }

  currentAgeHandler = (event) => {
    this.setState({currentAge: event.target.value})
  }
  pensionAgeHandler = (event) => {
    this.setState({pensionAge: event.target.value})
  }
  amountHandler = (event) => {
    this.setState({amount: event.target.value})
  }

  onClickHandlerCalc = async (event) => {
      event.preventDefault();
      await this.setState({ageDiff: this.state.pensionAge-this.state.currentAge});
      await this.setState({pension: (this.state.ageDiff*this.state.amount/this.state.defaultPensionYears)});
    //  this.props.setupSaveButton(this.state);
  }

  onClickHandlerSave = async (event) => {
      event.preventDefault();
      this.props.setupSaveButton(this.state);
  }


  render() {
    return (
      // jahre einzahlen, summe, jahre auszahlen, button: anlegen, alter, alter rente
      <div>
      <center>
        current age: <p> <input type="text" name="currentAge" value={this.state.currentAge} onChange={this.currentAgeHandler} /> </p>
        pension age: <p> <input type="text" name="pensionAge" value={this.state.pensionAge} onChange={this.pensionAgeHandler} /> </p>
        monthly amount: <p> <input type="text" name="currentAge" value={this.state.amount} onChange={this.amountHandler} /> </p>
        <br /> years until pension: {this.state.ageDiff}
        <br /> monthly pension: {this.state.pension}
        <br />
        <ButtonGroup toggle>
          <p><Button onClick={this.onClickHandlerCalc} variant="primary" size ="lg">calculate</Button></p><p>  </p>
          <p><Button onClick={this.onClickHandlerSave} variant="primary" size ="lg">save</Button></p>
        </ButtonGroup>

      </center>
      </div>
    );
  }
}
export default Setup;
