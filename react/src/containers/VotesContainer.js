import React, { Component } from 'react'
import FlatButton from "../components/FlatButton"

class VotesContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      disabledUpvote: false,
      disabledDownvote: false
    }
    this.handleUpvoteClicked=this.handleUpvoteClicked.bind(this);
    this.handleDownvoteClicked=this.handleDownvoteClicked.bind(this);
  }

  handleUpvoteClicked() {
      if (!this.state.disabledUpvote) {
        this.setState({
          disabledUpvote: true,
          disabledDownvote: false
        });
      }
    }

  handleDownvoteClicked() {
    if (!this.state.disabledDownvote) {
      this.setState({
        disabledUpvote: false,
        disabledDownvote: true
      });
    }
  }

  render() {
    return(
      <div style={{ textAlign: "center" }}>
        <FlatButton
          label="Upvote"
          primary={true}
          disabled={this.state.disabledUpvote}
          onClick={this.handleUpvoteClicked}
        />
        <FlatButton
          label="Downvote"
          secondary={true}
          disabled={this.state.disabledDownvote}
          onClick={this.handleDownvoteClicked}
         />
      </div>
    )
  }
}
