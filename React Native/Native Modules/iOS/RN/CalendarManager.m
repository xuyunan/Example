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

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(addEvent:(NSString *)name params:(NSDictionary *)params)
{
    NSString *location = [RCTConvert NSString:params[@"location"]];
    NSDate *time = [RCTConvert NSDate:params[@"time"]];
    NSString *description = [RCTConvert NSString:params[@"description"]];
    RCTLogInfo(@"事件: %@, 地点: %@, 时间: %@, 备注: %@", name, location, time, description);
}

// 给RN用的常量 (CalendarManager.firstDayOfTheWeek)
- (NSDictionary *)constantsToExport
{
    return @{ @"firstDayOfTheWeek": @"Monday" };
}

@end
