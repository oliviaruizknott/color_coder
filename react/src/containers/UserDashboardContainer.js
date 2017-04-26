import React, { Component } from 'react'
import UserColor from '../components/UserColor'

class UserDashboardContainer extends Component {
  constructor(props) {
    super(props)
    this.state = {
      colors: [],
      currentUser: [],
      currentUserColors: []
    }
    this.onProfileClick=this.onProfileClick.bind(this)
  }

  onProfileClick(){
    fetch('http://localhost:3000/api/current_user', {method: 'get'})
      .then(response => {
        response.json();
      })
      .then(user => {
        this.setState({ currentUser: user });
      });
      let currentUserColorsArray = []
      this.state.colors.map (color => {
        if (this.state.currentUser == color.user) {
          currentUserColorsArray.push(color)
        }
      })
      this.setState({ currentUserColors: currentUserColorsArray })
  }

  componentDidMount(){
    fetch('http://localhost:3000/api/colors', {method: 'get'})
      .then(response => response.json())
      .then(body => {
        this.setState({ colors: body })
      })
  }
  render(){
    let all_the_colors = this.state.currentUserColors.map (color => {
      return(
        <UserColor
          key = {color.id}
          id = {color.id}
          hex_code = {color.hex_code}
          nickname = {color.nickname}
        />
      )
    }

    )
    return(
      <div>
        <input type="button" onClick={this.onProfileClick}></input>
        {all_the_colors}
      </div>
    )
  }
}



export default UserDashboardContainer
