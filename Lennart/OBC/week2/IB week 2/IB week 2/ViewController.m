//
//  ViewController.m
//  IB week 2
//
//  Created by Lennart van Mourik on 07-09-11.
//  Copyright (c) 2011 -. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize urlTextField;
@synthesize webView;
@synthesize labelSwitch;
@synthesize switchOutlet;
@synthesize datePickerOutlet;
@synthesize textField;
@synthesize label;



@synthesize userName=_userName;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    
    NSString *urlString = @"http://nusport.nl";
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [webView loadRequest:request];
    
    
}

- (void)viewDidUnload
{
    [self setTextField:nil];
    [self setLabel:nil];
    [self setLabelSwitch:nil];
    [self setSwitchOutlet:nil];
    [self setDatePickerOutlet:nil];
    [self setWebView:nil];
    [self setUrlTextField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)changeLabelSwitch:(id)sender {
    if(self.switchOutlet.on) {
        self.labelSwitch.text = @"ON";
    }
    else {
        self.labelSwitch.text = @"OFF";
    }
}

- (IBAction)changeGreeting:(id)sender {
    self.userName = self.textField.text;
    
    NSString *nameString = self.userName;
    if ([nameString length] == 0) {
        nameString = @"World";
    }
    NSString *greeting = [[NSString alloc] initWithFormat:@"Hello, %@!", nameString];
    self.label.text = greeting;
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
        [theTextField resignFirstResponder];
    return YES;
}



- (IBAction)popupDate:(id)sender {
    NSDate *date = self.datePickerOutlet.date;
    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Date you picked" message:date.description delegate:nil cancelButtonTitle:@"Close" otherButtonTitles: nil];
    [alert show];
}

- (IBAction)loadUrl:(id)sender {
    NSString *urlString = self.urlTextField.text;
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [webView loadRequest:request];
    
    
    
}
@end
