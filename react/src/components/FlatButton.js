import React, { Component } from 'react'

class FlatButton extends Component {
  constructor(props) {
    super(props);
  }

  componentDidMount(){
    fetch('http://localhost:3000/api/reviews', {method: 'get'})
      .then(response => response.json())
      .then(body => {
        this.setState({ colors: body })
      })
  }

  render(){
    return(
      <div>button</div>
    )
  }
}
