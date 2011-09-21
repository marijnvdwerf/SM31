//
//  DetailViewController.h
//  week4lesib
//
//  Created by Lennart van Mourik on 21-09-11.
//  Copyright (c) 2011 -. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
