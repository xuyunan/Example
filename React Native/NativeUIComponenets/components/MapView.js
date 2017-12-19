import PropTypes from 'prop-types'
import React from 'react'
import { requireNativeComponent } from 'react-native'

class MapView extends React.Component {

    _onRegionChange = (event) => {
        if (!this.props.onRegionChange) {
          return;
        }
        // process raw event...
        this.props.onRegionChange(event.nativeEvent);
      }

    render() {
        return <RNTMap 
                {...this.props} 
                onRegionChange={this._onRegionChange}
                />;
    }
}

// 控制原生的组件的属性
MapView.propTypes = {
    // 控制缩放
    zoomEnabled: PropTypes.bool,
    // 控制显示区域
    region: PropTypes.shape({
    /**
     * Coordinates for the center of the map.
     */
    latitude: PropTypes.number.isRequired,
    longitude: PropTypes.number.isRequired,

    /**
     * Distance between the minimum and the maximum latitude/longitude
     * to be displayed.
     */
    latitudeDelta: PropTypes.number.isRequired,
    longitudeDelta: PropTypes.number.isRequired,
    }),
    // 区域改变回调函数
    onRegionChange: PropTypes.func,
}

var RNTMap = requireNativeComponent('RNTMap', MapView)

module.exports = MapView