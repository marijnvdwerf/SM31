//
//  OrderDetailsViewController.h
//  iCanHasFoodPlz
//
//  Created by Marijn van der Werf on 05-10-11.
//  Copyright (c) 2011 Fontys Hogeschool ICT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Order.h"

@interface OrderDetailsViewController : UIViewController

@property (nonatomic, retain) Order *order;
@property (weak, nonatomic) IBOutlet UILabel *totalPriceLabel;

- (id) initWithOrder:(Order *)order;

@end
