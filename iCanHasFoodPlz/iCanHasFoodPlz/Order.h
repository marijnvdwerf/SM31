//
//  Order.h
//  iCanHasFoodPlz
//
//  Created by Marijn van der Werf on 28-09-11.
//  Copyright (c) 2011 Fontys Hogeschool ICT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Order : NSObject

@property (nonatomic, retain) NSDate *lastEdited;
@property (nonatomic, retain) NSDate *deliveryTarget;
@property (nonatomic, retain) NSDate *lastUploaded;
@property (nonatomic) Boolean hasBeenPayed;
@property (nonatomic) Boolean volunteerForShopping;
@property (nonatomic, retain) NSMutableDictionary *items;

- (Boolean) isUploaded;
- (void) sendToServer;
- (float) totalPrice;

- (void) addItem: (NSInteger) itemId;
- (void) removeItem: (NSInteger) itemId;
- (Boolean) isItemOrdered: (NSInteger) itemId;


@end
