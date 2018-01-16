import React, { Component } from 'react';
import { Actions } from 'react-native-router-flux';
import NavBar from '../components/NavBar';
import YNButton from '../components/YNButton';
import {
  StyleSheet,
  Text,
  View,
  Button
} from 'react-native';

export default class Login extends Component {

  // 导航左侧按钮
  leftNavBarBtnClicked() {
    console.log('rightNavBarBtnClicked')
  }

  // 导航右侧按钮
  rightNavBarBtnClicked() {
    Actions.push('register', {'phone': '155xxxx9413'})
  }

  render() {
    return (
      <View style={styles.container}>
        <NavBar 
          title={this.props.title} 
          left='返回' 
          right='注册'
          leftNavBarBtnClicked={this.leftNavBarBtnClicked}
          rightNavBarBtnClicked={this.rightNavBarBtnClicked}/>

          <View style={styles.content}>
            <YNButton title='确认支付'/>
          </View>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    height: '100%',
    backgroundColor: '#FFFFFF',
  },
  content: {
    margin: 30,
  }
});
