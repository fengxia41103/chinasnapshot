import React from 'react';
import ReactDOM from 'react-dom';
import PersonIndexBox from "./persons.jsx";
import ProfileBox from "./profile.jsx";
import AjaxContainer from "./ajax.jsx";

var _ = require('lodash');
var classNames = require('classnames');

var randomId = function() {
  return "DHS" + (Math.random() * 1e32).toString(12);
};

var RootBox = React.createClass({
  getInitialState: function() {
    return {
      data: [],
      person: null,
    }
  },
  setItem: function(person_id) {
    // Toggle
    if (this.state.person != person_id) {
      this.setState({
        person: person_id
      });
    } else {
      this.setState({
        person: null
      });
    }
  },
  render: function() {
    return (
      <div className = "container" >
            <PersonIndexBox setItem={this.setItem}
                       activeItem={this.state.person}/>

            <ProfileBox activeItem={this.state.person} />
          </div>
    );
  }
});

module.exports = RootBox;