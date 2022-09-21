import React from 'react'
import ReactDOM from 'react-dom'
import logo from '../images/bottle.png'



export default function Header() {
    return (
        <header className='App-header'>
            <img className='logo' src={logo} alt={'bottle logo'} />
            <h1>Triple J Brewery Finder</h1>

        </header>
    )
}