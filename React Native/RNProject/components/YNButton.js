import React, { Component } from 'react';
import {
    StyleSheet,
    Text,
    View,
    TouchableHighlight
} from 'react-native';

export default class YNButton extends Component {

    constructor(props) {
      super(props);
      this.onPress = this.onPress.bind(this)
    }
    
    onPress() {
        console.log(this.props.title)
    }

    render() {
        return (
            <TouchableHighlight 
            onPress={this.onPress}
            underlayColor='#000000'>
                <View style={styles.buttonContainer}>
                    <Text style={styles.title}>{this.props.title}</Text>
                </View>
            </TouchableHighlight>
        );
    }
}

const styles = StyleSheet.create({
    buttonContainer: {
        backgroundColor: '#54B631',
        flexDirection: 'row',
        justifyContent: 'center',
        height: 50,
    },
    title: {
        height: 50,
        color: '#FFFFFF',
        textAlign: 'center',
        lineHeight: 50,
        fontSize: 16,
    }
});
