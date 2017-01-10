import React from 'react';
import ReactDOM from 'react-dom';
import d3plus from 'd3plus';
import PersonBox from "./persons.jsx";
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
            keys: [],
            selectedKeys: [],
            person: null,
        }
    },
    setItem: function(person_id){
      // Toggle
      if (this.state.person != person_id){
        this.setState({
          person: person_id
        });
      }else{
        this.setState({
          person: null
        });
      }
    },
    _cleanData: function(data) {
        console.log("_cleanData");
    },
    componentWillMount: function() {
        var cleanData = this._cleanData;
      var data = $.getJSON("/downloads/demo.json");
    },

    render: function() {
        return (
          <div className = "container" >
            <PersonBox setItem={this.setItem}
                       activeItem={this.state.person}/>
          </div>
        );
    }
});

module.exports = RootBox;
