/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {Scene, Router, Actions } from 'react-native-router-flux';
import {
  Platform,
  StyleSheet,
  Text,
  View
} from 'react-native';
import Login from './pages/Login';
import Register from './pages/Register';

export default class App extends Component {

  constructor(props) {
    super(props)
    this.login = this.login.bind(this)
  }

  login() {
    console.log('1111111')
  }

  render() {

    const scenes = Actions.create(
      <Scene key="root">
        <Scene key="login" component={Login} title="登录"/>
        <Scene key="register" component={Register} title="注册"/>
      </Scene>
    )

    return (
      <Router scenes={scenes}/>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  }
});
