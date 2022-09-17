import Main from './Components/Main/Main'
import {Provider} from 'react-redux'
import {BrowserRouter} from 'react-router-dom'
import {ConfigureStore} from './Redux/configureStore'
import Header from './Components/Header'
import Footer from './Components/Footer'
import './App.css'

const store = ConfigureStore();

function App() {

  // const breweries = (THIS NEEDS TO FETCH DATA).map(beer =>{
//     return (
//       <Brewery 
//           key={brewery.id}
//           {...brewery}
//       />
//     )
//   })

//   const beers = (THIS NEEDS TO FETCH DATA).map(beer => {
//     return (
//         <Beer
//             key={beer.id}
//             {...beer}
            
//         />
//     )
// })   

  return (
    <Provider store={store}>
      <Header/>
      <BrowserRouter>
        <Main/>
      </BrowserRouter>
      <Footer/>
    </Provider>
  );
}

export default App;
