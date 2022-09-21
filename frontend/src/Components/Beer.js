import React, {useState} from "react";
import ReactDOM from "react-dom";
import {addBeer, deleteBeer, viewBeers} from './Crud'
import axios from 'axios';


// const handleSubmit = () => {
//     const data = {
//         token:this.state.token

//     } ;
//     axios.post(URL,data)
//     .then((response) => {
//         this.setState({user:response.data})
//     })
//     axios.get(URL)
//     .then((response) =>{
//         this.setState({user:response.data})
//     })
// }

// const getBeer = () => {
//     axios.get("http://localhost:8080/beers")
//     .then((response) =>{
//         setBeers(response.data)
//     })
// }




export default function Beer(props) {
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
            {/* <img src={`${beers.img_url}`}> </img> */}

                <button onClick={() => getBeer()}>Get Beer</button>
                {beers.map(beer => <p>{beer.beer_name + " : " + beer.brewery_name}</p>)}
                <button onClick={() => getBrewery()}>Get Breweries</button>
                {brewery.map(brewery => <p>{brewery.breweryName + " : " + brewery.address}</p>)}
                {/* <img 
                    src={`${beers.img_url}`} 
                    className="beer-image" 
                /> */}
                {/* <div className="beer-info">
                    <span className="beer-name">{props.beer_name}</span>
                    <span className="description">{props.description}</span>
                    <span className="beer-abv">{props.abv}</span>
                    <span className="beer-style">{props.style}</span>
                </div> */}
            </div>
    )
}