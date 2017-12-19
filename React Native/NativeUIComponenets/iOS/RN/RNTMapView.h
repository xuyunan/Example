//
//  RNTMapView.h
//  RN+OC
//
//  Created by tommy on 2017/12/19.
//  Copyright © 2017年 xuyunan0113@gmail.com. All rights reserved.
//

#import <MapKit/MapKit.h>
#import <React/RCTComponent.h>

@interface RNTMapView : MKMapView

@property (nonatomic, copy) RCTBubblingEventBlock onRegionChange;

@end
