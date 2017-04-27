import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import UserDashboardContainer from './containers/UserDashboardContainer'
import ReviewsContainer from './containers/ReviewsContainer'

$(function() {
  if (document.getElementById('app')) {
    ReactDOM.render(
      <UserDashboardContainer />,
      document.getElementById('app')
    );
  }
});

$(function() {
  if (document.getElementById("reviews")) {
    ReactDOM.render(
      <ReviewsContainer />,
      document.getElementById('reviews')
    );
  }
});
