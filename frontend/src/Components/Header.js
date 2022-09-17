import React from 'react'
import ReactDOM from 'react-dom'

export default function Header() {
    return (
        <header className='App-header'>
            <img className='logo' src={require('../images/bottle.png')} alt={'bottle logo'} />
            <h1>Triple J Brewery Finder</h1>

        </header>
    )
}