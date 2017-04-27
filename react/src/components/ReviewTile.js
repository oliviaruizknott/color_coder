import React, { Component } from 'react';

class ReviewTile extends Component {
  constructor(props) {
    super(props);
    this.state={
      current_user: []
    }
  }

  componentWillMount() {
    fetch('http://localhost:3000/api/current_user', { credentials: "same-origin"})
      .then(response => response.json())
      .then(responseBody => {
        this.setState({ current_user: responseBody })
      })
  }


  render() {
    return(
      <div className="reviews">
        <div className="name">
          <h3>Rating: {this.props.rating}</h3>
        </div>
        <div className="body">
          <h3>{this.props.body}</h3>
        </div>
      </div>
    )
  }
}

export default ReviewTile;
