
import React from 'react';
import { StyleSheet, Text, View, TouchableHighlight, AppRegistry, NativeModules } from 'react-native';

export default class Calendar extends React.Component {

  render() {
    return ( 
      <View style={styles.container}>

        <TouchableHighlight 
          underlayColor='#EAECEE'
          onPress={() => this._onPressAddEvent()}>
          <Text style={styles.item}>添加日历事件</Text>
        </TouchableHighlight>

        <View style={styles.fullWithLine} />
      </View>
    );
  }

  _onPressAddEvent() {

    var date = new Date('2018/12/12 20:30:00')

    var CalendarManager = NativeModules.CalendarManager
    
    CalendarManager.addEvent('生日聚会', {
      location: "淞南公园羊蝎子火锅店",
      time: date.getTime(),
      description: "可能下雨，注意带伞"
    })

    console.log(CalendarManager.firstDayOfTheWeek);
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection: 'column',
    backgroundColor: '#FFFFFF',
    alignItems: 'stretch',
    justifyContent: 'flex-start',
    marginTop: 40,
  },
  item: {
    color: '#212121',
    fontSize: 16,
    height: 50,
    lineHeight: 50,
    textAlign: 'center',
  },
  fullWithLine: {
    backgroundColor: '#E0E0E0',
    height: 1,
  }
});

// Module name
AppRegistry.registerComponent('Calendar', () => Calendar);