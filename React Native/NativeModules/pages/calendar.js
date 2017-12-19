
import React from 'react';
import { StyleSheet, Text, View, TouchableHighlight, AppRegistry, NativeModules, NativeEventEmitter } from 'react-native';

const { CalendarManager } = NativeModules;

export default class Calendar extends React.Component {
   
  subscription

  constructor(props) {
    super(props);
  
    this.state = {
      events: "", 
      message: ""
    }
  }

  componentDidMount() {
    const calendarManagerEmitter = new NativeEventEmitter(CalendarManager);
    subscription = calendarManagerEmitter.addListener(
      'EventReminder',
      (reminder) => this.setState({message: reminder.name})
    )
  }

  componentWillUnmount() {
    subscription.remove()   // 移除注册的事件
  }

  render() {
    return ( 
      <View style={styles.container}>

        <TouchableHighlight 
          underlayColor='#EAECEE'
          onPress={() => this._onPressAddEvent()}>
          <Text style={styles.item}>添加日历事件</Text>
        </TouchableHighlight>

        <View style={styles.fullWithLine} />

        <TouchableHighlight 
          underlayColor='#EAECEE'
          onPress={() => this._showEvents()}>
          <Text style={styles.item}>获取事件列表</Text>
        </TouchableHighlight>

        <View style={styles.fullWithLine} />


        <Text style={styles.content}>{this.state.events}</Text>

        <Text style={styles.content}>{this.state.message}</Text>

      </View>
    );
  }

  _onPressAddEvent() {

    var date = new Date('2018/12/12 20:30:00')

    var calendarManager = NativeModules.CalendarManager
    
    calendarManager.addEvent('生日聚会', {
      location: "淞南公园羊蝎子火锅店",
      time: date.getTime(),
      description: "可能下雨，注意带伞"
    })

    console.log(calendarManager.firstDayOfTheWeek);
  }

  async _showEvents() {
    try {
      var calendarManager = NativeModules.CalendarManager
      var events = await calendarManager.findEvents()
      var eventsString = events.join('|')

      this.setState({events: '调用原生, 返回数据:' + eventsString})
    } catch (e) {
      console.error(e);
    }
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection: 'column',
    backgroundColor: '#FFFFFF',
    alignItems: 'stretch',
    justifyContent: 'flex-start',
    marginTop: 50,
  },
  item: {
    color: '#212121',
    fontSize: 16,
    height: 50,
    lineHeight: 50,
    textAlign: 'center',
  },
  content: {
    color: '#212121',
    fontSize: 16,
    height: 50,
    textAlign: 'center',
    marginTop: 50,
  },
  fullWithLine: {
    backgroundColor: '#E0E0E0',
    height: 1,
  }
});

// Module name
AppRegistry.registerComponent('Calendar', () => Calendar);