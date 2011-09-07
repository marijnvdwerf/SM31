//
//  ViewController.m
//  week 2
//
//  Created by Marijn van der Werf on 07-09-11.
//  Copyright (c) 2011 Fontys Hogeschool ICT. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize webView;
@synthesize urlTextbox;
@synthesize textField;
@synthesize label;
@synthesize button;
@synthesize switchLabel;
@synthesize switchOutlet;
@synthesize datePicker;
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
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *urlString = @"http://tweakers.net";
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [webView loadRequest:request];
    
    
}

- (void)viewDidUnload
{
    [self setTextField:nil];
    [self setLabel:nil];
    [self setButton:nil];
    [self setSwitchLabel:nil];
    [self setSwitchOutlet:nil];
    [self setDatePicker:nil];
    [self setWebView:nil];
    [self setUrlTextbox:nil];
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
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (IBAction)changeGreeting:(id)sender {
    self.userName = self.textField.text;
    
    NSString *nameString = self.userName;
    
    if ([nameString length] == 0) {
        nameString = @"Wereld";
    }
    
    NSString *greeting = [[NSString alloc] initWithFormat:@"Hallo %@!", nameString];
    self.label.text = greeting;
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.textField) {
        [theTextField resignFirstResponder];
    } else if (theTextField == self.urlTextbox) {
        [theTextField resignFirstResponder];
        self.loadUrl;
    }
    return YES;
}

- (IBAction)toggleSwitch:(id)sender {
    if(self.switchOutlet.on) {
        self.switchLabel.text = @"AAN";
    } else {
        self.switchLabel.text = @"UIT";
    }
}
- (IBAction)showDate:(id)sender {
    
    NSDate *date = self.datePicker.date;
    
    //NSString *alertText = [[NSString alloc] initWithFormat:@"%@ %@ %@" @"D" @"M" @"Y"];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Datum:" message:date.description delegate:nil cancelButtonTitle:@"Sluit" otherButtonTitles: nil];
    
    [alert show];
                                                                       
                                                                       
}
- (IBAction)goButtonPressed:(id)sender {
    self.loadUrl;
}

- (void)loadUrl {
    NSString *urlString = self.urlTextbox.text;
    if([urlString length] == 0) {
        urlString = self.urlTextbox.placeholder;
    }
    NSURL *url = [[NSURL alloc] initWithString:urlString];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [webView loadRequest:request];
}
@end
