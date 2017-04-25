import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import UserDashboardContainer from './containers/UserDashboardContainer'
import UserDashboardReviewsContainer from './containers/UserDashboardReviewsContainer'

$(function() {
  ReactDOM.render(
    <UserDashboardContainer
    />,
    document.getElementById('app')
  );
});

$(function() {
  ReactDOM.render(
    <UserDashboardReviewsContainer
    />,
    document.getElementById('user_review')
  );
});
