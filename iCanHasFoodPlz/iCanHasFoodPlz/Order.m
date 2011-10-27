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
    /*NSComparisonResult *result = [self.lastUploaded compare:self.lastEdited];
    if(result == NSOrderedDescendingscom) {
        NSLog(@"Meeste recente versie is geupload");
        return YES;
    } else {
        NSLog(@"De laatste versie staat nog niet online");
        return NO;
    }*/
    return YES;
}

- (id) initWithOrderDictionary:(NSDictionary*)orderInfo {
    self = [super init];
    if (self) {
        // Delivery date
        int timestamp = [[orderInfo objectForKey:@"date"] intValue];
        self.deliveryTarget = [NSDate dateWithTimeIntervalSince1970:timestamp];
        
        // Volunteering
        Boolean volunteer = [[orderInfo objectForKey:@"volunteer"] boolValue];
        self.volunteerForShopping = volunteer;
        
        // Items
        self.items = [[NSMutableDictionary alloc] init];
        NSArray *items = [orderInfo objectForKey:@"items"];
        for (NSDictionary *item in items) {
            [self.items setValue:[NSNumber numberWithInt:1] forKey:[item objectForKey:@"item_id"]];
        }
        

        
        self.items = [[NSMutableDictionary alloc] init];
    }
    return(self);
}

- (id) init {
    self = [super init];
    if (self) {       
        self.items = [[NSMutableDictionary alloc] init];
    }
    return(self);
}


- (void) sendToServer {
    self.lastUploaded = [[NSDate alloc] initWithTimeIntervalSinceNow: 0];
    
    NSLog(@"Geüpload op %@", [self.lastUploaded description]);
}

- (float) totalPrice {
    NSLog(@"Prijs");
    return 12.54;
}

- (Boolean)isItemOrdered:(NSInteger)itemId {
    NSNumber *item = [self.items objectForKey:[NSString stringWithFormat:@"%@", itemId]];
    
    if(item == nil) {
     return false;
    }
    
    return true;
}

- (void)addItem:(NSInteger)itemId {
    NSInteger itemCount = 1;
    
    [self.items setValue:[NSNumber numberWithInt:itemCount] forKey:[NSString stringWithFormat:@"%@", itemId]];
}

- (void)removeItem:(NSInteger)itemId {
    [self.items removeObjectForKey:[NSString stringWithFormat:@"%@", itemId]];
}

@end
