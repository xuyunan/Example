//
//  RCTConvert+Mapkit.m
//  RN+OC
//
//  Created by tommy on 2017/12/19.
//  Copyright © 2017年 xuyunan0113@gmail.com. All rights reserved.
//

#import "RCTConvert+Mapkit.h"

@implementation RCTConvert (Mapkit)

+ (MKCoordinateSpan)MKCoordinateSpan:(id)json
{
    json = [self NSDictionary:json];
    return (MKCoordinateSpan) {
        [self CLLocationDegrees:json[@"latitudeDelta"]],
        [self CLLocationDegrees:json[@"longitudeDelta"]]
    };
}

+ (MKCoordinateRegion)MKCoordinateRegion:(id)json
{
    return (MKCoordinateRegion) {
        [self CLLocationCoordinate2D:json],
        [self MKCoordinateSpan:json]
    };
}

@end
