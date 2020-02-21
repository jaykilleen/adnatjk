import React from 'react'
import ReactDOM from 'react-dom'
import axios from 'axios';
import Home from '../adnat/home'

document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(
      <Home name="React" />,
      document.getElementById('react'),
    )
  }
)