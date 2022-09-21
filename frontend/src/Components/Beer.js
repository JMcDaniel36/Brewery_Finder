import React from "react";
import ReactDOM from "react-dom";
import {addBeer, deleteBeer, viewBeers} from './Crud'
import axios from 'axios';



export default function Beer(props) {
    return (
            <div className="beer-display" > 
                <h1>Im gonna be beer</h1>
                <img 
                    src={`${props.img_url}`} 
                    className="beer-image" 
                />
                <div className="beer-info">
                    <span className="beer-name">{props.beer_name}</span>
                    <span className="description">{props.description}</span>
                    <span className="beer-abv">{props.abv}</span>
                    <span className="beer-style">{props.style}</span>
                </div>
            </div>
    )
}