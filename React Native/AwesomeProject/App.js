import React from 'react';
import { StyleSheet, Text, View, Image, TouchableHighlight } from 'react-native';

export default class App extends React.Component {
  render() {
    return (
      <View style={styles.container}>
        <View style={styles.topContainer}>
          <Image
            style={{width: 66, height: 66}}
            source={require('./img/Icon.png')}
          />
          <Text style={styles.appName}>小惊喜</Text>
          <Text style={styles.appVersion}>v1.0.0</Text>
        </View>

        <View style={styles.bottomContainer}>

          <TouchableHighlight 
            underlayColor='#EAECEE'
            onPress={this.onPressAppraise}>
            <Text style={styles.bottomItem}>评价我们</Text>
          </TouchableHighlight>
          
          <View style={styles.fullWithLine} />
            <TouchableHighlight 
              underlayColor='#EAECEE'
              onPress={this.onPressService}>
              <Text style={styles.bottomItem}>服务条款</Text>
            </TouchableHighlight>

          <View style={styles.fullWithLine} />
        </View>
      </View>
    );
  }

  onPressAppraise = () => {
    console.log('onPressAppraise')
  }

  onPressService = () => {
    console.log('onPressService') 
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection: 'column',
    backgroundColor: '#FFFFFF',
    alignItems: 'stretch',
    justifyContent: 'center',
  },
  topContainer: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  bottomContainer: {
    flex: 1,
    alignItems: 'stretch',
    justifyContent: 'flex-end',
    marginBottom: 70,
  },
  bottomItem: {
    color: '#212121',
    fontSize: 16,
    height: 50,
    lineHeight: 50,
    textAlign: 'center',
  },
  appName: {
    color: '#333333',
    fontSize: 20,
    marginTop: 10, 
  },
  appVersion: {
    color: '#9E9E9E',
    fontSize: 14,
    marginTop: 5, 
  },
  fullWithLine: {
    backgroundColor: '#E0E0E0',
    height: 0.5,
  }
});
