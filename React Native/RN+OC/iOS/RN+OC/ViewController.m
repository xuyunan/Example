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

- (IBAction)gotoRNPage:(id)sender
{
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    
    NSURL *jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/pages/about.bundle?platform=ios"];
    RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL: jsCodeLocation
                                                        moduleName: @"About"
                                                 initialProperties: @{@"version": version}
                                                     launchOptions: nil];
    UIViewController *vc = [[UIViewController alloc] init];
    vc.title = @"关于";
    vc.view = rootView;
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)gotoCommunicationPage:(id)sender
{
    RNViewController *vc = [[RNViewController alloc] init];
    vc.title = @"RN调用OC示例";
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
