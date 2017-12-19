//
//  RCTConvert+Mapkit.h
//  RN+OC
//
//  Created by tommy on 2017/12/19.
//  Copyright © 2017年 xuyunan0113@gmail.com. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <React/RCTConvert.h>
#import <CoreLocation/CoreLocation.h>
#import <React/RCTConvert+CoreLocation.h>

@interface RCTConvert (Mapkit)

+ (MKCoordinateSpan)MKCoordinateSpan:(id)json;
+ (MKCoordinateRegion)MKCoordinateRegion:(id)json;

@end
