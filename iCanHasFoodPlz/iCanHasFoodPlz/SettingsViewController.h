//
//  SettingsViewController.h
//  iCanHasFoodPlz
//
//  Created by Marijn van der Werf on 31-10-11.
//  Copyright (c) 2011 Fontys Hogeschool ICT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIFormDataRequest.h"

@interface SettingsViewController : UITableViewController <UITextFieldDelegate, ASIHTTPRequestDelegate>

@property (nonatomic, retain) UITextField *nameTextField;

@end
