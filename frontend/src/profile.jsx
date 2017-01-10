import React from 'react';
import AjaxContainer from "./ajax.jsx";

var _ = require('lodash');
var classNames = require('classnames');

var randomId = function() {
    return "CH" + (Math.random() * 1e32).toString(12);
};

var ProfileBox = React.createClass({
    getInitialState: function(){
        return {
            data: []
        }
    },
    _getUrl: function(id){
        // Build API url
        var baseUrl = "http://localhost:8000/api/v1/career/?format=json&charset=utf8&person=";
        return baseUrl+id;
    },
    handleUpdate: function(data){
        this.setState({
            data: this._cleanData(data.objects)
        });
    },
    _cleanData: function(data){
        // Career  data cleanse function.
        // Here we are to normalize API data into a data format
        // that is uniform for consumption internally.
        if (typeof data === "undefined" || data === null){
            return [];
        }else{
            var tmp = [];
            for (var i = 0; i<data.length; i++){
                // Internal data format
                tmp.push({
                    start: data['start'],
                    end: data['end'],
                    title: data['title']['name'],
                    abbrev: data['title']['abbrev'],
                    eng_name: data['title']['eng_name'],
                    org: data['title']['org']['name']
                });
            }

            // Sort data by "date" field
            return  _.sortBy(tmp, 'start');
        }

    },
    render: function(){
        // If selected person has changed, update data
        var changed = false;
        var currentValue = this.props.activeItem && this.props.activeItem.valueOf();
        if (currentValue != null && (this.preValue !== currentValue || this.state.data.length==0)){
          this.preValue = currentValue;
          var api = this._getUrl(this.props.activeItem);
            return (
              <div>
                <AjaxContainer
                    handleUpdate={this.handleUpdate}
                    apiUrl={api} />
              </div>
            );
        }

        // Render content
        return (
        <div>
        {this.props.activeItem}: {this.state.data}
        </div>
        );

    }
});

module.exports = ProfileBox;