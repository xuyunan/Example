
import React from 'react';
import { StyleSheet, Text, View, AppRegistry, UIManager } from 'react-native';
import MapView from '../components/MapView'

// 对应原生RNTMapManager中的constantsToExport
var MapViewiOSConstants = UIManager.RNTMap.Constants;

export default class MyApp extends React.Component {

  _onRegionChange(event) {
    console.log(event)
  }

  render() {
    // 微盟大厦
    var region = {
      latitude: 31.349496,
      longitude: 121.496985,
      latitudeDelta: 0.1,
      longitudeDelta: 0.1,
    }

    return ( 
      <View style={styles.container}>
        <MapView 
          region={region}      
          zoomEnabled={false} 
          style={styles.map}
          onRegionChange={this._onRegionChange} 
        />
      </View>
    )
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection: 'column',
    backgroundColor: '#FFFFFF',
    alignItems: 'stretch',
    justifyContent: 'flex-start',
  },
  map: {
    height: MapViewiOSConstants.ComponentHeight,
    width: MapViewiOSConstants.ComponentWidth,
  }
});

// Module name
AppRegistry.registerComponent('MyApp', () => MyApp);