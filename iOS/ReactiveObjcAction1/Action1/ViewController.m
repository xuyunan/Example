//
//  ViewController.m
//  Action1
//
//  Created by Yunan Xu on 02/12/2017.
//  Copyright © 2017 xuyunan0113@gmail.com. All rights reserved.
//

// 示例内容:
// 1. RAC处理并行事件
//    通过merge, 将多个RACSignal合并, 也就是将事件合并, 各自并行处理完成后(也就是发送sendCompleted消息, 当然还有其它消息, 如:sendError:), 会触发subscribeCompleted block,
//    当有发送sendError消息的时, 会触发subscribeError block
// 2. RAC处理串行事件
//    通过RACSignal的flattenMap, 很方便的将事件串起来, 最终执行completed block
//
//    RAC的这种事件处理方式跟ES的Promise非常相似

#import "ViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

// 并行
- (IBAction)concurrentBtnClicked:(id)sender
{
    RACSignal *signal = [RACSignal merge:@[[self fetchUserRepos], [self fetchOrgRepos]]];
    
    [signal subscribeCompleted:^{
        NSLog(@"They're both done!");
    }];
    
    [signal subscribeError:^(NSError *error) {
        NSLog(@"Error occured");
    }];
}

// 串行
- (IBAction)serialBtnClicked:(id)sender
{
    @weakify(self)
    [[[[self logInUser]
       flattenMap:^RACStream *(NSString *user) {    // 这里如果不需要上个signal传递过来的参数, 可以直接使用then
           NSLog(@"user: %@", user);
           @strongify(self)
           return [self loadCachedMessagesForUser:user];
       }] flattenMap:^RACStream *(NSString *lastMessageID) {
           @strongify(self)
           return [self fetchMessagesAfterMessage:lastMessageID];
       }] subscribeNext:^(NSArray *newMessages) {
           NSLog(@"New messages: %@", newMessages);
       } completed:^{
           NSLog(@"Fetched all messages.");
       }];
    
// then
//    [[self logInUser] then:^RACSignal *{
//        @strongify(self)
//        NSString *user = @"default";
//        return [self loadCachedMessagesForUser:user];
//    }];
}

#pragma mark - 测试并行事件

- (RACSignal *)fetchUserRepos
{
    // 模拟请求消息
    RACSubject *subject =[RACSubject subject];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"Start fetchUserRepos...");
        [NSThread sleepForTimeInterval:3];
        NSLog(@"End fetchUserRepos...");
        [subject sendCompleted];
    });
    return subject;
}

- (RACSignal *)fetchOrgRepos
{
    // 模拟请求消息
    RACSubject *subject =[RACSubject subject];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"Start fetchOrgRepos...");
        [NSThread sleepForTimeInterval:10];
        NSLog(@"End fetchOrgRepos...");
        [subject sendCompleted];
        // [subject sendError:[NSError errorWithDomain:@"com.xuyunan.example" code:@"8080" userInfo:nil]];
    });
    return subject;
}

#pragma mark - 测试串行事件

- (RACSignal *)logInUser
{
    NSLog(@"正在登录...");
    RACSubject *subject = [RACSubject subject];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"登录完成...");
        [subject sendNext:@"Tommy"];
        [subject sendCompleted];
    });
    
    return subject;
}

- (RACSignal *)loadCachedMessagesForUser:(NSString *)user
{
    NSLog(@"正在获取缓存消息(%@)...", user);
    RACSubject *subject = [RACSubject subject];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"获取缓存消息完成(%@)...", user);
        [subject sendNext:@"88888"];
        [subject sendCompleted];
    });
    
    return subject;
}

- (RACSignal *)fetchMessagesAfterMessage:(NSString *)lastMessageID
{
    // 模拟请求消息
    RACSubject *subject =[RACSubject subject];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"正在请求最新消息(%@)...", lastMessageID);
        [NSThread sleepForTimeInterval:5];
        NSLog(@"请求最新消息完成(%@)...", lastMessageID);
        [subject sendNext:@[@"msg", @"msg", @"msg"]];
        [subject sendCompleted];
    });
    return subject;
}

@end
