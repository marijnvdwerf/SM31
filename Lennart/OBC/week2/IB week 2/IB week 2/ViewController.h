//
//  ViewController.h
//  IB week 2
//
//  Created by Lennart van Mourik on 07-09-11.
//  Copyright (c) 2011 -. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>


- (IBAction)dismissKeyboard:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *textField;

@property (strong, nonatomic) IBOutlet UILabel *label;


@property (nonatomic, copy) NSString *userName;

- (IBAction)changeLabelSwitch:(id)sender;

- (IBAction)changeGreeting:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *labelSwitch;

@property (strong, nonatomic) IBOutlet UISwitch *switchOutlet;



@property (strong, nonatomic) IBOutlet UIDatePicker *datePickerOutlet;

@property (strong, nonatomic) IBOutlet UIWebView *webView;

- (IBAction)popupDate:(id)sender;



- (IBAction)loadUrl:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *urlTextField;

@end
