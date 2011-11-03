//
//  ShoppingListDetailsViewController.h
//  iCanHasFoodPlz
//
//  Created by Marijn van der Werf on 02-11-11.
//  Copyright (c) 2011 Fontys Hogeschool ICT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShoppingList.h"

@interface ShoppingListDetailsViewController : UITableViewController

@property (nonatomic, retain) ShoppingList *shoppingList;
@property (nonatomic, retain) NSDictionary *itemDetails;

- (UITableViewCell *) getCellForIdentifier:(NSString *)identifier;
@end
