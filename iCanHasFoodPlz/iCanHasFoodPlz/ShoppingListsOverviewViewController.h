//
//  ShoppingListsOverviewViewController.h
//  iCanHasFoodPlz
//
//  Created by Marijn van der Werf on 28-09-11.
//  Copyright (c) 2011 Fontys Hogeschool ICT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PullRefreshTableViewController.h"
#import "ASIFormDataRequest.h"

@interface ShoppingListsOverviewViewController : PullRefreshTableViewController <ASIHTTPRequestDelegate>

@property (nonatomic, retain) NSMutableArray *shoppingLists;

- (void)parseListDictionary:(NSDictionary*)listDictionary;

@end
