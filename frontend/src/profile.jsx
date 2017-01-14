import React from 'react';
import AjaxContainer from "./ajax.jsx";

var _ = require('lodash');
var classNames = require('classnames');

var randomId = function() {
  return "CH" + (Math.random() * 1e32).toString(12);
};

var ProfileBox = React.createClass({
  render: function(){
    return (
      <CareerBox {...this.props}/>
    );
  }
});

var CareerBox = React.createClass({
  getInitialState: function() {
    return {
      data: []
    }
  },
  _getUrl: function(id) {
    // Build API url
    var baseUrl = "http://localhost:8000/api/v1/career/?format=json&charset=utf8&person=";
    return baseUrl + id;
  },
  handleUpdate: function(data) {
    // For some reason, function has to be called
    // outside this.replaceState itself.
    // Otherwise, it will never return and update state.data!
    var cleaned = this._cleanData(data.objects);

    // Update state, will trigger render update.
    this.replaceState({
      data: cleaned
    });
  },
  _cleanData: function(data) {
    // Career  data cleanse function.
    // Here we are to normalize API data into a data format
    // that is uniform for consumption internally.
    if (typeof data === "undefined" || data === null) {
      return [];
    } else {
      var tmp = [];
      for (var i = 0; i < data.length; i++) {
        // Internal data format
        tmp.push({
          start: data[i].start?data[i].start.slice(0,4):'', // year only
          end: data[i].end?data[i].end.slice(0,4):'', // year only
          title: data[i].post.title.name,
          grade: data[i].post.title.grade.name,
          abbrev: data[i].post.title.abbrev,
          eng_name: data[i].post.title.eng_name,
          division: data[i].post.admin.name,
          level: data[i].post.admin.level,
          branch: data[i].post.org.branch,
          experience: data[i].experience,
          start_age: data[i].start_age,
        });
      }
      // Sort data by "start" field
      return _.reverse(_.sortBy(tmp, 'start'));
    }
  },
  render: function() {
    // If selected person has changed, update data
    var currentValue = this.props.activeItem && this.props.activeItem.valueOf();
    if (currentValue != null && (this.preValue !== currentValue || this.state.data.length == 0)) {
      this.preValue = currentValue;
      var api = this._getUrl(this.props.activeItem);

      return (
        <div>
        <AjaxContainer handleUpdate={this.handleUpdate} apiUrl={api} />
      </div>
      );
    }

    // Render content
    return (
      <div>
        {this.state.data.length?
         <CareerTable careers={this.state.data} {...this.props} />:null}
    </div>
    );
  }
});

var CareerTable = React.createClass({
  render: function() {
    const careers = this.props.careers.map((t) => {
      var tmpKey = randomId();
      return (
        <tr key={tmpKey}>
          <td>{t.start}</td>
          <td>{t.end?t.end:"present"}</td>
          <td>{t.abbrev}</td>
          <td>{t.grade}</td>
          <td>{t.division==t.level?t.division:t.division+t.level}</td>
          <td>{t.branch}</td>
          <td>{t.start_age}</td>
          <td>{t.experience} {t.experience>1?"years":"year"}</td>
          </tr>
      );
    });

    return (
      <div>
        <h1>Career</h1>
        <table className="table table-responsive table-hover table-condensed">
          <thead><tr>
        <th>Start</th>
        <th>End</th>
        <th>Title</th>
        <th>Grade</th>
        <th>Where</th>
        <th>Branch</th>
        <th>Start age</th>
        <th>Experience</th>
        </tr></thead>

        <tbody>
          {careers}
        </tbody>
        </table>
      </div>

    );
  }
});

module.exports = ProfileBox;
