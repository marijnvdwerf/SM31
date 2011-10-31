//
//  GeoLocationUpdater.m
//  iCanHasFoodPlz
//
//  Created by Marijn van der Werf on 31-10-11.
//  Copyright (c) 2011 Fontys Hogeschool ICT. All rights reserved.
//

#import "GeoLocationUpdater.h"
#import "ASIFormDataRequest.h"

@implementation GeoLocationUpdater

- (id) init {
    self = [super init];
    if (self) {       
        locationManager = [[CLLocationManager alloc] init];
        [locationManager setDelegate:self];
        [locationManager setDistanceFilter:kCLLocationAccuracyNearestTenMeters];
        [locationManager startUpdatingLocation];
        NSLog(@"Locatie bijhouden...");
    }
    return(self);
}

- (void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    NSURL *url = [[NSURL alloc] initWithString:@"http://school.navale.nl/p5/icanhasfood/updateGeo.php"];
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
    CLLocationCoordinate2D coordinate = [newLocation coordinate];
    
    [request setPostValue:[NSNumber numberWithDouble: coordinate.latitude] forKey:@"lat"];
    [request setPostValue:[NSNumber numberWithDouble: coordinate.longitude] forKey:@"lon"];
    [request setPostValue:@"1" forKey:@"user"];
    [request setDelegate:self];
    [request start];
}

- (void) requestFinished:(ASIHTTPRequest *)request {
    NSLog(@"%@", request.responseString);
}

@end
