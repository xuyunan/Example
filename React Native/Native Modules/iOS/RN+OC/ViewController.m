//
//  ViewController.m
//  RN+OC
//
//  Created by Yunan Xu on 17/12/2017.
//  Copyright © 2017 xuyunan0113@gmail.com. All rights reserved.
//

#import "ViewController.h"
#import <React/RCTRootView.h>
#import "RNViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.view.backgroundColor = [UIColor whiteColor];
}

- (IBAction)gotoCommunicationPage:(id)sender
{
    RNViewController *vc = [[RNViewController alloc] init];
    vc.title = @"RN调用OC示例";
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)sendMessageToRN:(id)sender
{
    RNViewController *vc = [[RNViewController alloc] init];
    vc.title = @"RN调用OC示例";
    [self.navigationController pushViewController:vc animated:YES];
    
    // 用于测试向RN发送消息
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
       [[NSNotificationCenter defaultCenter] postNotificationName:@"EventReminder" object:nil userInfo:@{@"name": @"您有一条新消息"}];
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
