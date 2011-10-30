//
//  AddOrderOverviewViewController.h
//  iCanHasFoodPlz
//
//  Created by Lennart van Mourik on 12-10-11.
//  Copyright (c) 2011 Fontys Hogeschool ICT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Order.h"

@interface AddOrderOverviewViewController : UITableViewController

@property (nonatomic, retain) Order *order;
@property (nonatomic, retain) NSDictionary *itemInfo;

@end
