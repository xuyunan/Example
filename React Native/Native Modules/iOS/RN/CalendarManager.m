//
//  CalendarManager.m
//  RN+OC
//
//  Created by tommy on 2017/12/18.
//  Copyright © 2017年 xuyunan0113@gmail.com. All rights reserved.
//

#import "CalendarManager.h"
#import <React/RCTLog.h>
#import <React/RCTConvert.h>

@implementation CalendarManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(calendarEventReminderReceived:)
                                                     name:@"EventReminder"
                                                   object:nil];
    }
    return self;
}

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(addEvent:(NSString *)name params:(NSDictionary *)params)
{
    NSString *location = [RCTConvert NSString:params[@"location"]];
    NSDate *time = [RCTConvert NSDate:params[@"time"]];
    NSString *description = [RCTConvert NSString:params[@"description"]];
    RCTLogInfo(@"事件: %@, 地点: %@, 时间: %@, 备注: %@", name, location, time, description);
}

/**
 RN调用OC函数, 结果通过promises回调给RN

 @param findEvents 函数名
 @param resolve 成功回调
 @param rejecter 失败回调
 @return void
 */
RCT_REMAP_METHOD(findEvents, findEventsWithResolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
    NSArray *events = @[@"EVENTS0", @"EVENTS1", @"EVENTS2"];
    if (events) {
        resolve(events);
    } else {
        NSString *code = @"10010";
        NSError *error = [NSError errorWithDomain:@"com.xuyunan.NativeModules" code:[code integerValue] userInfo:nil];
        reject(code, @"There were no events", error);
    }
}

// 支持的通知事件，写在这里
- (NSArray<NSString *> *)supportedEvents
{
    return @[@"EventReminder"];
}

- (void)calendarEventReminderReceived:(NSNotification *)notification
{
    NSString *eventName = notification.userInfo[@"name"];
    [self sendEventWithName:@"EventReminder" body:@{@"name": eventName}];
}

// 给RN用的常量 (CalendarManager.firstDayOfTheWeek)
- (NSDictionary *)constantsToExport
{
    return @{ @"firstDayOfTheWeek": @"Monday" };
}

@end
