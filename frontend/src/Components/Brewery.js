import React from "react";
import ReactDOM from "react-dom";
import {newBrewery, updateBrewery, viewBreweries } from "./Crud"

export default function Brewery(props) {
    return (
        <div className="brewery-display" > 
            <h1>I will be pictures brewery</h1>
            <img 
                src={`${props.imagePath}`} 
                className="brewery-image" 
            />
            <div>
                <span className="brewery-name">{props.breweryName}</span>
            </div>
            <div className="brewery-info">
                <p className="brewery-website">{props.website}</p>
                <p className="brewery-address">{props.address}
                    <span className="brewery-city">{props.city}</span>
                    <span className="brewery-state">{props.state}</span>
                </p>
            </div>
        </div>
    )
}