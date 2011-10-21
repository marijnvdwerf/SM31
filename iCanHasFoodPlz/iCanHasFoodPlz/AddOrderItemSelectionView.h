//
//  AddOrderItemSelectionView.h
//  iCanHasFoodPlz
//
//  Created by Marijn van der Werf on 05-10-11.
//  Copyright (c) 2011 Fontys Hogeschool ICT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Order.h"

@interface AddOrderItemSelectionView : UITableViewController

@property (nonatomic, retain) NSDictionary *items;
@property (nonatomic, retain) Order *order;

- (IBAction)cancel:(id)sender;

@end
