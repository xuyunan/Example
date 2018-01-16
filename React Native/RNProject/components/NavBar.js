import React, { Component } from 'react';
import NavBarButton from './NavBarButton';
import {
    StyleSheet,
    Text,
    View,
    Button
} from 'react-native';

export default class NavBar extends Component {

    render() {
        return (
            <View style={styles.navBarContainer}>
                <View style={styles.statusBar} />
                <View style={styles.navBar}>
                    <NavBarButton title={this.props.left} onPress={this.props.leftNavBarBtnClicked}/>
                    <View>
                        <Text style={styles.center}>{this.props.title}</Text>
                    </View>
                    <NavBarButton title={this.props.right} onPress={this.props.rightNavBarBtnClicked}/>
                </View>
            </View>
        );
    }
}

const styles = StyleSheet.create({
    navBarContainer: {
        flexDirection: 'column',
        backgroundColor: '#54B631',
        height: 64,
    },
    statusBar: {
        backgroundColor: 'transparent',
        height: 20,
    },
    navBar: {
        flexDirection: 'row',
        justifyContent: 'space-between',
        alignItems: 'center',
        backgroundColor: 'transparent',
        height: 44,
    },
    center: {
        fontSize: 19,
        color: '#FFFFFF',
    },
});
