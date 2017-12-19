//
//  RNViewController.m
//  RN+OC
//
//  Created by tommy on 2017/12/18.
//  Copyright © 2017年 xuyunan0113@gmail.com. All rights reserved.
//

#import "RNViewController.h"
#import <React/RCTRootView.h>

@interface RNViewController ()

@end

@implementation RNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL *jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/pages/calendar.bundle?platform=ios"];
    RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL: jsCodeLocation
                                                        moduleName: @"Calendar"
                                                 initialProperties: @{}
                                                     launchOptions: nil];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view = rootView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
