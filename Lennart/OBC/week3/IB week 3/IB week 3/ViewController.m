//
//  ViewController.m
//  IB week 3
//
//  Created by Lennart van Mourik on 14-09-11.
//  Copyright (c) 2011 -. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize daderArray;
@synthesize wapenArray;
@synthesize motiefArray;
@synthesize singlePicker;



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
    
    self.daderArray = [[NSArray alloc] initWithObjects:@"Jan", @"Henk",@"Piet",@"André",@"Tom", nil];
    self.wapenArray = [[NSArray alloc] initWithObjects:@"Pistool", @"Mes",@"knuppel",@"Wurging",@"Granaat",@"Autobom",@"Duw in ravijn", nil];
    self.motiefArray = [[NSArray alloc] initWithObjects:@"Jaloers", @"Overspel",@"Geflipt",@"Wraak",@"Afgunst", nil];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.singlePicker = nil;
    self.daderArray = nil;
    self.wapenArray = nil;
    self.motiefArray = nil;
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
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown)&&(interfaceOrientation = UIInterfaceOrientationLandscapeLeft);
}







- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0){
        return [daderArray count];
    }
    else if (component == 1){
        return [wapenArray count];
    }
    else {
        return [motiefArray count];
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0){
        return [daderArray objectAtIndex:row];
    }
    else if (component == 1){
        return [wapenArray objectAtIndex:row];
    }
    else {
        return [motiefArray objectAtIndex:row];
    }
}








@end
