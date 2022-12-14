import {Component} from 'react'
import {Switch, Route, Redirect, Link} from 'react-router-dom'
import Login from '../Login/Login'
import Register from '../Register/Register'
import Home from '../Home/Home'
import {addToken, deleteUser} from '../../Redux/actionCreators'
import {connect} from 'react-redux'
import {withRouter} from 'react-router-dom'
import axios from 'axios'
//import brewery from 'C:/Users/JMcDa/Documents/Meritamerica/Capstone/final-capstone/frontend/src/images/brewery.png'

//const baseUrl = "http://localhost:8080/";

const mapStateToProps = state => {
    return {
        token: state.token,
        user: state.user
    }
}
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

const mapDispatchToProps = (dispatch) => ({
    addToken: () => { dispatch(addToken()) },
    deleteUser: () => { dispatch(deleteUser())}
});

class Main extends Component {
    constructor(props){
        super(props);
    }

    handleLogout = () => {
        this.props.addToken("")
        this.props.deleteUser()
    }

    render(){
        return(
            <div className = "user-info">
                {this.props.token.token !== undefined ?
                        <div>

                            <Link to='/home'>Home | </Link>
                            <Link to='/login' onClick={this.handleLogout}>logout</Link> 
                            <Redirect to='/home'/>
                            
                           

                        </div>  
                    : 
                        <Link to='/login'>Home | </Link>
                }
               
                <Switch>
                    <Route path='/login' component={() => <Login/>}/>
                    <Route path='/register'component={() => <Register/>}/>
                    <Route path='/home' component={this.props.token.token !== undefined ? () => <Home/> : null}/>
                    <Redirect to='/login'/>
                </Switch>
                {/* <img className='breweryImage' src={brewery} alt={'brewery'} /> */}
                <br></br>
            </div>
        )
    }
} 

export default withRouter(connect(mapStateToProps, mapDispatchToProps)(Main));