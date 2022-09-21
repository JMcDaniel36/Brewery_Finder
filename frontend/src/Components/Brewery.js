import React, {useState} from "react";
import ReactDOM from "react-dom";
import {newBrewery, updateBrewery, viewBreweries } from "./Crud"
import axios from 'axios';

export default function Brewery(props) {
    const [beers, setBeers] = useState([]);
    const [brewery, setBrewery] = useState([]);

    const getBeer = () => {
        axios.get("http://localhost:8081/beers")
        .then((response) =>{
            console.log(response.data)
            setBeers(response.data)
        }).then(console.log(beers))
    }

    const getBrewery = () => {
        axios.get("http://localhost:8081/breweries")
        .then((response) => {
            console.log(response.data)
            setBrewery(response.data)
        }).then(console.log(brewery))
    }





    return (
        <div className="beer-display" > 
            <img 
                src={beers.img_url} 
                className="beer-image" 
            />
            <div>
                {/* <span className="brewery-name">{props.breweryName}</span>
            </div>
            <div className="brewery-info">
                <p className="brewery-website">{props.website}</p>
                <p className="brewery-address">{props.address}
                    <span className="brewery-city">{props.city}</span>
                    <span className="brewery-state">{props.state}</span>
                </p> */}
            </div>
        </div>
    )
}