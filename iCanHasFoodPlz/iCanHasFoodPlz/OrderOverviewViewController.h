//
//  OrderOverviewViewController.h
//  iCanHasFoodPlz
//
//  Created by Marijn van der Werf on 28-09-11.
//  Copyright (c) 2011 Fontys Hogeschool ICT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Order.h"
#import "PullRefreshTableViewController.h"

@interface OrderOverviewViewController : PullRefreshTableViewController
@property (nonatomic, retain) NSMutableArray *orders;


@end
