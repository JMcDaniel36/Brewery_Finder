import React from "react";
import ReactDOM from "react-dom";
import {newBrewery, updateBrewery, viewBreweries } from "./Crud"

export default function Brewery(props) {
    return (
        <div className="brewery-display" > 
            <img 
                src={`${props.imagePath}`} 
                className="brewery-image" 
            />
            <div>
                <span className="brewery-name">{props.breweryName}</span>
            </div>
            <div className="brewery-info">
                <p className="brewery-website">{props.breweryName}</p>
                <p className="brewery-address">{props.breweryName}
                    <span className="brewery-city">{props.breweryName}</span>
                    <span className="brewery-state">{props.breweryName}</span>
                </p>
            </div>
        </div>
    )
}