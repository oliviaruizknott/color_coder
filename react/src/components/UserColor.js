import React, { Component } from 'react'

class UserColor extends Component {
  constructor(props) {
    super(props)
  }

  render(){
    return(
      <h4> {this.props.hex_code} </h4>
    )
  }
}



export default UserColor;
