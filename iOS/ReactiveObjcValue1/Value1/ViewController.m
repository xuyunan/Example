//
//  ViewController.m
//  Value1
//
//  Created by Yunan Xu on 02/12/2017.
//  Copyright © 2017 xuyunan0113@gmail.com. All rights reserved.
//

// 示例内容:
// 1. 展示RAC最基本的用法, 代替KVO, 监听一个属性值的变化
// 2. 可以通过filter过滤一些情况
// 3. 可以通过map对值做一些操作, 比如格式化, 数值的计算

#import "ViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "User.h"

@interface ViewController ()

@property (nonatomic, strong) User *user;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _user = [[User alloc] init];
    _user.name = @"Tommy";
    _user.age = 0;
    
    // 代替KVO
    [RACObserve(_user, name) subscribeNext:^(id x) {
        NSLog(@"name: %@", x);
    }];
    
    // age大于10, 才响应订阅事件
    [[RACObserve(_user, age) filter:^BOOL(id value) {
        return [value integerValue] > 10;
    }] subscribeNext:^(id x) {
        NSLog(@"age: %@", x);
    }];
    
    // name经过处理之再后传给事件
    [[RACObserve(_user, name) map:^id(NSString *value) {
        return [value uppercaseString];
    }] subscribeNext:^(id x) {
        NSLog(@"AGE: %@", x);
    }];
}

- (IBAction)nameBtnClicked:(id)sender
{
    _user.name = @"Tommy";
}

- (IBAction)ageBtnClicked:(id)sender
{
    _user.age++;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
