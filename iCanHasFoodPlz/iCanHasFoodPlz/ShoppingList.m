//
//  ShoppingList.m
//  iCanHasFoodPlz
//
//  Created by Marijn van der Werf on 05-10-11.
//  Copyright (c) 2011 Fontys Hogeschool ICT. All rights reserved.
//

#import "ShoppingList.h"

@implementation ShoppingList
@synthesize received = _received,
            due = _due,
            items = _items;

- (id) init {
    self = [super init];
    if (self) {       
        self.items = [[NSMutableDictionary alloc] init];
    }
    return(self);
}

- (id) initWithShoppingListDictionary:(NSDictionary*)shoppingListInfo {
    self = [super init];
    if (self) {
        /*// Delivery date
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
         }*/
    }
    return(self);
}

@end
