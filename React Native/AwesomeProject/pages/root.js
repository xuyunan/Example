import React from 'react';
import { StyleSheet, Text, View, TouchableHighlight } from 'react-native';

export default class Root extends React.Component {

  static navigationOptions = {
    title: '主页',
  };

  render() {

    const { navigate } = this.props.navigation;

    return (
      <View style={styles.container}>
        <TouchableHighlight 
            underlayColor='#EAECEE'
            onPress={() => navigate('About', { version: '1.0.1' })}>
            <Text style={styles.item}>关于页面</Text>
        </TouchableHighlight>
            
        <View style={styles.line} />
      </View>
    );
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
  item: {
    color: '#212121',
    fontSize: 16,
    height: 50,
    lineHeight: 50,
    textAlign: 'center',
  },
  line: {
    backgroundColor: '#E0E0E0',
    height: 0.5,
  }
});
