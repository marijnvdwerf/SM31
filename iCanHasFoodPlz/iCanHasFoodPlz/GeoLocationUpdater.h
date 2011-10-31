//
//  GeoLocationUpdater.h
//  iCanHasFoodPlz
//
//  Created by Marijn van der Werf on 31-10-11.
//  Copyright (c) 2011 Fontys Hogeschool ICT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "ASIFormDataRequest.h"

@interface GeoLocationUpdater : NSObject <CLLocationManagerDelegate, ASIHTTPRequestDelegate> {
    CLLocationManager *locationManager;
}

@end
