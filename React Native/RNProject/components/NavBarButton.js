import React, { Component } from 'react';
import {
  StyleSheet,
  Button
} from 'react-native';

export default class NavBarButton extends Component {

  constructor(props) {
    super(props);
  }

  render() {
    return (
      <Button color='#FFFFFF' title={this.props.title} onPress={this.props.onPress}/>
    );
  }
}

const styles = StyleSheet.create({
    
});
