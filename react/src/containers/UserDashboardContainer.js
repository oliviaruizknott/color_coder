import React, { Component } from 'react'
import UserColor from '../components/UserColor'

class UserDashboardContainer extends Component {
  constructor(props) {
    super(props)
    this.state = {
      colors: []
    }
  }

  componentDidMount(){
    fetch('http://localhost:3000/api/colors', {method: 'get'})
      .then(response => response.json())
      .then(body => {
        this.setState({ colors: body })
      })
  }
  render(){
    let all_the_colors = this.state.colors.map (color => {
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
        {all_the_colors}
      </div>
    )
  }
}



export default UserDashboardContainer
