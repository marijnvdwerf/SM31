//
//  ViewController.h
//  week 2
//
//  Created by Marijn van der Werf on 07-09-11.
//  Copyright (c) 2011 Fontys Hogeschool ICT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
@property (nonatomic, copy) NSString *userName;

@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) IBOutlet UIButton *button;
- (IBAction)changeGreeting:(id)sender;

- (IBAction)toggleSwitch:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *switchLabel;
@property (strong, nonatomic) IBOutlet UISwitch *switchOutlet;

@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
- (IBAction)showDate:(id)sender;

@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UITextField *urlTextbox;

- (IBAction)goButtonPressed:(id)sender;
- (void)loadUrl;

@end
