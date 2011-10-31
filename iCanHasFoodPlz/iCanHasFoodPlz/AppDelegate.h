//
//  AppDelegate.h
//  iCanHasFoodPlz
//
//  Created by Marijn van der Werf on 21-09-11.
//  Copyright (c) 2011 Fontys Hogeschool ICT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GeoLocationUpdater.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) GeoLocationUpdater *geoLocationUpdater;

@end
