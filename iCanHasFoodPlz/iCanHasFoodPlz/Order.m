//
//  Order.m
//  iCanHasFoodPlz
//
//  Created by Marijn van der Werf on 28-09-11.
//  Copyright (c) 2011 Fontys Hogeschool ICT. All rights reserved.
//

#import "Order.h"

@implementation Order
@synthesize lastEdited=_lastEdited,
            deliveryTarget=_deliveryTarget,
            lastUploaded=_lastUploaded,
            hasBeenPayed=_hasBeenPayed,
            volunteerForShopping=_volunteerForShopping,
            items=_items;


- (Boolean) isUploaded {
    NSComparisonResult *result = [self.lastUploaded compare:self.lastEdited];
    if(result == NSOrderedDescending) {
        NSLog(@"Meeste recente versie is geupload");
        return YES;
    } else {
        NSLog(@"De laatste versie staat nog niet online");
        return NO;
    }
}


- (void) sendToServer {
    self.lastUploaded = [[NSDate alloc] initWithTimeIntervalSinceNow: 0];
    
    NSLog(@"Geüpload op %@", [self.lastUploaded description]);
}

- (float) totalPrice {
    return 12.54;
}

@end
