import React, { Component } from 'react'

class UserDashboardContainer extends Component {
  constructor(props) {
    super(props)
    this.state = {
      colors: [],
      currentBannerColor: "#FFFFFF"
    }
    this.onHeaderClick=this.onHeaderClick.bind(this)
  }

  brightness(colorString) {
    let redString = colorString.substring(1,3);
    let red = parseInt(redString,16);
    let greenString = colorString.substring(3,5);
    let green = parseInt(greenString,16);
    let blueString = colorString.substring(5,7);
    let blue = parseInt(blueString,16);
    let luma=(0.33*red)+(0.5*green)+(0.16*blue);
    return luma;
  };

  textColor(colorString) {
    let luma = this.brightness(colorString);
    console.log(luma);
    if (luma > 128) {
      return "#000000";
    } else {
      return "#FFFFFF";
    }
  }

  onHeaderClick(){
    console.log("clicked")
    let index = Math.floor(Math.random()*this.state.colors.length)
    let color = this.state.colors[index]
    this.setState({ currentBannerColor: color.hex_code})
  }

  componentDidMount(){
    fetch('http://localhost:3000/api/colors', {method: 'get'})
      .then(response => response.json())
      .then(body => {
        this.setState({ colors: body })
        let index = Math.floor(Math.random()*body.length)
        let color = body[index]
        this.setState({ currentBannerColor: color.hex_code})
      })
  }

  render(){
    let divStyle = {
      backgroundColor: this.state.currentBannerColor,
      color: this.textColor(this.state.currentBannerColor),
      // padding: "10px",
      // margin: "20px",
      width: "100%",
      height: "300px",
      border: "1px black solid",
      textAlign: "center",
      verticalAlign: "top",
      marginTop: "30px"
    };
    return(
      <div style={divStyle} onClick={this.onHeaderClick}>
        <div className="index">
          <h1>COLOR_CODER</h1>
          <p>Welcome to color_coder, where colors are rated.</p>
        </div>
      </div>
    )
  }
}

export default UserDashboardContainer
