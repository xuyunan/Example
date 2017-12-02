//
//  ViewController.m
//  Value2
//
//  Created by Yunan Xu on 02/12/2017.
//  Copyright © 2017 xuyunan0113@gmail.com. All rights reserved.
//

// 示例内容:
// 1. RAC通过类别给很多UI组件进行了封装, 使得很方便的就可以获取组件的值
// 2. RAC赋值操作, 这里不再是一个model属性发生了变化, 通知事件. 而是事件变化的结果绑定到一个变量上.
// = 就像一个管道一样, 右边事件有变动, 左边的值就会跟着变

#import "ViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *password;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /* 第一种写法
    // 其它状态
    // [self.nameTextField rac_signalForControlEvents:<#(UIControlEvents)#>]
    [[self.nameTextField rac_textSignal] subscribeNext:^(id x) {
        self.name = x;
    }];
    
    [[self.passwordTextField rac_textSignal] subscribeNext:^(id x) {
        self.password = x;
    }];
    */
    
    // 第二种, 极简写法
    RAC(self, name) = [self.nameTextField rac_textSignal];
    RAC(self, password) = [self.passwordTextField rac_textSignal];
    
    RAC(self, loginButton.enabled) = [RACSignal
                                      combineLatest:@[RACObserve(self, name), RACObserve(self, password)]
                                      reduce:^(NSString *name, NSString *password) {
                                          // 注意这里是id类型
                                          return @(name.length > 0 && password.length > 0);
                                      }];
}



@end
