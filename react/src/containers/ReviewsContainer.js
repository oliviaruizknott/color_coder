import React, { Component } from 'react';
import ReviewTile from '../components/ReviewTile';

class ReviewsContainer extends Component {
  constructor(props) {
    super(props)
    this.state={
      reviews: []
    }
  }

  componentWillMount() {
    fetch('http://localhost:3000/api/reviews')
      .then(response => response.json())
      .then(body => {
        this.setState({ reviews: body })
      })
  }

  render() {
    let color_id = document.URL.replace('http://localhost:3000/colors/', '')
    let color_reviews = this.state.reviews.map(review => {
      if ( review.color_id == color_id) {
        return(
          <ReviewTile
            key={review.id}
            id={review.id}
            rating={review.rating}
            body={review.body}
            timestamp={review.created_at}
          />
        )
      }
    })
    return(
      <div>
        {color_reviews}
      </div>
    )
  }
}

export default ReviewsContainer;
