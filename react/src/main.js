import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import UserDashboardContainer from './containers/UserDashboardContainer'
import ReviewsContainer from './containers/ButtonExample'

$(function() {
  if (document.getElementById('app')) {
    ReactDOM.render(
      <UserDashboardContainer />,
      document.getElementById('app')
    );
  }
});

$(function() {
  if (document.getElementById('color')) {
    ReactDOM.render(
      <ReviewsContainer />,
      document.getElementById('color')
    );
  }
});
