import React from 'react';
import { StyleSheet, NavigatorIOS} from 'react-native';
import RootNavigator from 'AwesomeProject/components/root-navigator.js';

export default class App extends React.Component {
  render() {
    return (
       <RootNavigator />
    );
  }
}

const styles = StyleSheet.create({

});
