import React, { Component } from 'react';
import { Actions } from 'react-native-router-flux';
import {
  StyleSheet,
  Text,
  View,
  Button
} from 'react-native';

export default class Register extends Component {

  constructor(props) {
    super(props)
    console.log('phone: ' + props.phone)
  }

  back() {
    Actions.push('register', {'phone': '155xxxx9413'})
  }

  render() {
    return (
      <View style={styles.container}>
        <Button title='Back' onPress={this.back}/>
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