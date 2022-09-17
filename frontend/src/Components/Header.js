import React from 'react'
import ReactDOM from 'react-dom'

export default function Header() {
    return (
        <header className='App-header'>
            <img src={require('../images/bottle-157844_1280.png')} alt={'bottle logo'} />
            <h1>Triple J Brewery Finder</h1>

        </header>
    )
}