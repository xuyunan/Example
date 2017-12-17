//
//  ViewController.m
//  RN+OC
//
//  Created by Yunan Xu on 17/12/2017.
//  Copyright © 2017 Yunan Xu. All rights reserved.
//

#import "ViewController.h"
#import <React/RCTRootView.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)gotoRNPage:(id)sender
{
    NSURL *jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/pages/about.bundle?platform=ios"];
    
    RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL: jsCodeLocation
                                                        moduleName: @"About"
                                                 initialProperties: @{@"version": @"1.0.2"}
                                                     launchOptions: nil];
    UIViewController *vc = [[UIViewController alloc] init];
    vc.title = @"关于";
    vc.view = rootView;
    
    [self.navigationController pushViewController:vc animated:YES];
    // [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
