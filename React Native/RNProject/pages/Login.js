import React, { Component } from 'react';
import { Actions } from 'react-native-router-flux';
import {
  StyleSheet,
  Text,
  View,
  Button
} from 'react-native';

export default class Login extends Component {

  register() {
    Actions.push('register')
  }

  render() {
    return (
      <View style={styles.container}>
        <Button title='register' onPress={this.register}/>
      </View>
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
