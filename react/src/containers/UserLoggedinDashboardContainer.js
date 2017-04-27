// import React, { Component } from 'react'

class UserLoggedinDashboardContainer extends Component {
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

  //
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
    // console.log(index)
    let color = this.state.colors[index]
    // console.log(color)
    this.setState({ currentBannerColor: color.hex_code})
    // console.log("clicked")
    // console.log(this.state.currentBannerColor)

  }

  componentDidMount(){
    fetch('http://localhost:3000/api/current_user', {method: 'get'})
      .then(fetch('http://localhost:3000/api/colors', {method: 'get'}))
      .then(response => response.json())
      .then(body => {
        this.setState({ colors: body })
        let index = Math.floor(Math.random()*body.length)
        // console.log("Mounted index = ")
        // console.log(index)
        let color = body[index]
        // console.log("Mounted color = ")
        // console.log(color)
        this.setState({ currentBannerColor: color.hex_code})
        // console.log("mounted state.currentBannerColor = ")
        // console.log(this.state.currentBannerColor)
      })
  }

  render(){
    // console.log("rendered")
    // console.log(this.state.currentBannerColor)
    let divStyle = {
      backgroundColor: this.state.currentBannerColor,
      color: this.textColor(this.state.currentBannerColor),
      // padding: "10px",
      // margin: "20px",
      width: "100%",
      height: "300px",
      border: "1px black solid",
      textAlign: "center",
      verticalAlign: "top"
    };
    // console.log("rendered divsyle=")
    // console.log(divStyle)
    return(
      <div style={divStyle} onClick={this.onHeaderClick}>
      <h1>COLOR_CODER</h1>
      <h3>Welcome to color_coder, where colors are rated.</h3>
      </div>
    )
  }
}

// export default UserLoggedinDashboardContainer
