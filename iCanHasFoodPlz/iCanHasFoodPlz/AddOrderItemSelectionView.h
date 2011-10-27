//
//  AddOrderItemSelectionView.h
//  iCanHasFoodPlz
//
//  Created by Marijn van der Werf on 05-10-11.
//  Copyright (c) 2011 Fontys Hogeschool ICT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Order.h"
#import "PullRefreshTableViewController.h"

@interface AddOrderItemSelectionView : PullRefreshTableViewController

@property (nonatomic, retain) NSDictionary *items;
@property (nonatomic, retain) Order *order;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *nextButton;

- (IBAction)cancel:(id)sender;
- (void)parseItemDictionary:(NSDictionary*)itemDictionary;

@end
