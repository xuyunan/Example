# React Native

RN的一些Demo, 原生编码用的OC

### 目录

* [AwesomeProject](AwesomeProject) - 使用[create-react-native-app](https://facebook.github.io/react-native/docs/getting-started.html)创建的一个RN demo   
* [RN+OC](RN+OC) - 展示React Native和原生(Objective-c)的结合, 原生组件如何往RN页面传递参数, RN页面如何接收参数 [communication-ios](https://facebook.github.io/react-native/docs/communication-ios.html)   
* [NativeModules](NativeModules) - 1、RN调用原生方法, 结果通过Promises回调给RN (这种桥接原生方法没有返回值); 2、原生给RN发送消息 [中文链接](http://reactnative.cn/docs/0.51/native-modules-ios.html) | [英文链接](https://facebook.github.io/react-native/docs/native-modules-ios.html)
* [NativeUIComponenets](NativeUIComponenets) - 原生组件封装给RN使用. 导出原生组件, 导出原生组件的属性、常量、回调函数


### 如何运行

1. 切换到该项目目录
2. npm install
3. npm start
4. cd iOS
5. pod install
6. 用Xcode打开.xcworkspace文件运行

### 一些命令

1. https://nodejs.org/
2. npm install -g create-react-native-app
3. npm install npm@4    // 使用npm4.x;  rn v0.51还不兼容npm5.x
4. cd PROJECT_PATH
5. npm start / npm run ios / npm run android
6. npm start -- --reset-cache



