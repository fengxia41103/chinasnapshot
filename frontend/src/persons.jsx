import React from 'react';
import IndexBox from "./index.jsx";

var _ = require('lodash');
var classNames = require('classnames');

//****************************************
//
//    Country containers
//
//****************************************
var PersonBox = React.createClass({
    render: function(){
        // Index list
        var indexes = "abcdefghijklmnopqrstuvwxyz".toUpperCase().split("");

        // API endpoint to get list of items
        var indexItemUrl = "http://localhost:8000/api/v1/person/?format=json&limit=1000";

        // Data are items retrieved from API.
        // Depending on its format, we are to extract
        // the actual items to list.
        var getItems = function(data){
            return data.objects;
        };

        // Determine an index is active
        var isIndexActive = function(activeIndex, i){
            return activeIndex && activeIndex === i;
        };

        // Determine an item is active
        var isItemActive = function(activeItem, i){
            return activeItem && _.some(activeItem, function(item){
              return i.id == item;
            });
        };

        // Map a list item to index for grouping
        var itemMapToIndex = function(i){
            return i.eng_name.charAt(0);
        };

        // Item value
        var getItemValue = function(i){
            return i.id;
        }

        // Item render display
        var getItemRender = function(i){
            return (
                <div>
                    {i.name} ({i.eng_name})
                </div>
            );
        }

        // Render
        return (
            <div>
                <IndexBox 
                    indexes={indexes}
                    indexItemUrl={indexItemUrl}
                    getItems={getItems}
                    isIndexActive={isIndexActive}
                    isItemActive={isItemActive}
                    itemMapToIndex={itemMapToIndex}
                    getItemValue={getItemValue}
                    getItemRender={getItemRender}
                    {...this.props} />
            </div>
        );
    }
});

module.exports = PersonBox;
