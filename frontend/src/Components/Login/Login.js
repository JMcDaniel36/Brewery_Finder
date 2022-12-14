import { Component } from 'react'
import {Link} from 'react-router-dom'
import {connect} from 'react-redux'
import {withRouter} from 'react-router-dom'
import {addToken, addUser} from '../../Redux/actionCreators'
import {baseUrl} from '../../Shared/baseUrl'
import axios from 'axios'



const mapDispatchToProps = (dispatch) => ({
    addToken: () =>  dispatch(addToken()),
    addUser: () => dispatch(addUser()) 
});

class Login extends Component {
    
    constructor(props){
        super(props);
        this.state = {
            username: '',
            password: ''
        }
        this.handleInputChange = this.handleInputChange.bind(this);
    }
    

    handleLogin = async () => {
        const data = { username: this.state.username, password: this.state.password };
        

        const userWithToken = await axios.post(baseUrl + '/login', data)

        
        await this.props.dispatch(addToken(userWithToken.data.token))
        await this.props.dispatch(addUser(userWithToken.data.user));
    }

    handleInputChange = (event) => {
        event.preventDefault()
        this.setState({
            [event.target.name]: event.target.value
        })
    }

    render(){
        return(
            <div className="login-box">
                <h1 className='sign-in-header'>Please Sign In To Your Triple J Account</h1>
                <label class="sr-only">Username</label>
                <div classname="input-box">
                    <input
                        type="text"
                        id="username"
                        name="username"
                        class="form-control"
                        placeholder="Username"
                        v-model="user.username"
                        onChange={this.handleInputChange}
                        required
                    />
                    <label class="sr-only">Password</label>
                    <input
                        type="password"
                        id="password"
                        name="password"
                        class="form-control"
                        placeholder="Password"
                        v-model="user.password"
                        onChange={this.handleInputChange}
                        required
                    />
                </div>
                
                <button type="submit" onClick={this.handleLogin} id='submit-button'>Sign in</button>
                <br></br>
                <Link to="/register" id='register-link'>Or sign up for one here!</Link>
            </div>
        )
    }
}

export default withRouter(connect(mapDispatchToProps)(Login));