import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import UserDashboardContainer from './containers/UserDashboardContainer'

$(function() {
  ReactDOM.render(
    <UserDashboardContainer />,
    document.getElementById('app')
  );
});
