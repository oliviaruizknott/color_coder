import React, { Component } from 'react'

class UserReview extends Component {
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
        <div>
            <h1> {this.props.review} </h1>
            <p> {this.props.rating} </p>
        </div>
    )
  }
}
