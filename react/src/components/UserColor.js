import React, { Component } from 'react'

class UserColor extends Component {
  constructor(props) {
    super(props)
  }


  render(){
    let divStyle = {
      backgroundColor: this.props.hex_code,
      padding: "10px",
      margin: "20px",
      width: "150px",
      height: "150px",
      border: "1px black solid",
      display: "inline-block",
      textAlign: "center",
      verticalAlign: "top"
    };
    let hexStyle = {
      paddingTop: "18px",
      textTransform: "uppercase"
    };
    return(
        <div style={divStyle}>
        <a href={`/colors/${this.props.id}`}>
            <h1 style={hexStyle}> {this.props.hex_code} </h1>
            </a>
            <p> {this.props.nickname} </p>
        </div>
    )
  }
}
