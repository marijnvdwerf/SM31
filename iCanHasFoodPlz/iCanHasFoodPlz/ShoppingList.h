//
//  ShoppingList.h
//  iCanHasFoodPlz
//
//  Created by Marijn van der Werf on 05-10-11.
//  Copyright (c) 2011 Fontys Hogeschool ICT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShoppingList : NSObject

@property (nonatomic, retain) NSDate *received;
@property (nonatomic, retain) NSDate *due;
@property (nonatomic, retain) NSDictionary *items;

- (id) initWithShoppingListDictionary:(NSDictionary*)shoppingListInfo;

@end
