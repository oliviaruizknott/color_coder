import React, { Component } from 'react'
import UserColor from '../components/UserReview'

class UserDashboardReviewsContainer extends Component {
  constructor(props) {
    super(props)
    this.state = {
      reviews: [],
      currentUser: []
    }
  }

  componentWillMount(){
    fetch('http://localhost:3000/api/reviews', {method: 'get'})
      .then(response => response.json())
      .then(body => {
        this.setState({ reviews: body })
      })
  }

  componentDidMount(){
    fetch('http://localhost:3000/api/current_user', {method: 'get'})
      .then(response => {
        response.json()
      })
      .then(user => {
        this.setState({ currentUser: user })
      })
  }
  render(){
    let all_the_reviews = this.state.reviews.map (review => {
      return(
        <UserReview
          key = {review.id}
          id = {review.id}
          review = {review.body}
          rating = {review.rating}
        />
      )
    }

    )
    return(
      <div>
        {all_the_reviews}
      </div>
    )
  }
}



export default UserDashboardReviewsContainer
