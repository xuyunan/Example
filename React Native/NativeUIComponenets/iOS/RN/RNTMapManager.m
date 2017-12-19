//
//  RNTMapManager.m
//  RN+OC
//
//  Created by tommy on 2017/12/19.
//  Copyright © 2017年 xuyunan0113@gmail.com. All rights reserved.
//

#import "RNTMapManager.h"
#import <React/RCTConvert.h>
#import <React/RCTConvert+CoreLocation.h>
#import "RCTConvert+Mapkit.h"
#import "RNTMapView.h"

@implementation RNTMapManager

RCT_EXPORT_MODULE()

RCT_EXPORT_VIEW_PROPERTY(zoomEnabled, BOOL)
RCT_EXPORT_VIEW_PROPERTY(onRegionChange, RCTBubblingEventBlock)

RCT_CUSTOM_VIEW_PROPERTY(region, MKCoordinateRegion, MKMapView)
{
    [view setRegion:json ? [RCTConvert MKCoordinateRegion:json] : defaultView.region animated:YES];
}

// 给RN用的常量
- (NSDictionary *)constantsToExport
{
    CGFloat width =  [UIScreen mainScreen].bounds.size.width;
    return @{@"ComponentHeight": @(200),
             @"ComponentWidth": @(width)};
}

- (UIView *)view
{
    RNTMapView *map = [RNTMapView new];
    map.delegate = self;
    return map;
}

#pragma mark MKMapViewDelegate

- (void)mapView:(RNTMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    if (!mapView.onRegionChange) {
        return;
    }
    
    MKCoordinateRegion region = mapView.region;
    mapView.onRegionChange(@{ @"region": @{ @"latitude": @(region.center.latitude),
                                            @"longitude": @(region.center.longitude),
                                            @"latitudeDelta": @(region.span.latitudeDelta),
                                            @"longitudeDelta": @(region.span.longitudeDelta), }});
}

@end
