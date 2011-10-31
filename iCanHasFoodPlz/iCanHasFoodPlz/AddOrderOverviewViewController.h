//
//  AddOrderOverviewViewController.h
//  iCanHasFoodPlz
//
//  Created by Lennart van Mourik on 12-10-11.
//  Copyright (c) 2011 Fontys Hogeschool ICT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Order.h"
#import "ASIFormDataRequest.h"

@interface AddOrderOverviewViewController : UITableViewController<ASIHTTPRequestDelegate>

@property (nonatomic, retain) Order *order;
@property (nonatomic, retain) NSDictionary *itemInfo;
@property (nonatomic, retain) UISwitch *volunteerSwitch;

- (IBAction)sendOrderToServer:(id)sender;
@end
