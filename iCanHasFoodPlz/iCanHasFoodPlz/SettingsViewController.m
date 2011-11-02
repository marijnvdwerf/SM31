//
//  SettingsViewController.m
//  iCanHasFoodPlz
//
//  Created by Marijn van der Werf on 31-10-11.
//  Copyright (c) 2011 Fontys Hogeschool ICT. All rights reserved.
//

#import "SettingsViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "Settings.h"
#import "ASIFormDataRequest.h"
#import "SVProgressHUD.h"


@implementation SettingsViewController

@synthesize nameTextField = _nameTextField;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [self setNameTextField:nil];
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"SettingsNameCell";
    if(indexPath.row == 1) {
        cellIdentifier = @"SettingsGroupCell";
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    
    
    if(indexPath.row == 0) {
        // Name input
        self.nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(125, 0, 175, cell.frame.size.height)];
        self.nameTextField.autocorrectionType = UITextAutocorrectionTypeNo; // no auto correction support
        self.nameTextField.autocapitalizationType = UITextAutocapitalizationTypeWords; // no auto capitalization support
        self.nameTextField.textAlignment = UITextAlignmentRight;
        self.nameTextField.adjustsFontSizeToFitWidth = YES;
        self.nameTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        self.nameTextField.textColor = cell.detailTextLabel.textColor;
        self.nameTextField.returnKeyType = UIReturnKeyDone;
        self.nameTextField.delegate = self;
        self.nameTextField.text = [Settings userName];
        
        [cell addSubview: self.nameTextField];
    } else {
        // Group selection is canceled.
    }
    
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0 && indexPath.row == 0 ) {
        // Name row
        [self.nameTextField becomeFirstResponder];
    }
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

}



- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if(![textField.text isEqualToString:@""]) {
        [textField resignFirstResponder];
        
        //Check if name has changed from Settings
        if (![textField.text isEqualToString:[Settings userName]]) {
            NSURL *url = [[NSURL alloc] initWithString:@"http://school.navale.nl/p5/icanhasfood/updateUser.php"];
            ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url];
            [request setPostValue:textField.text forKey:@"name"];
            [request setPostValue:[Settings userId] forKey:@"user"];
            [request setDelegate:self];
            [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeGradient];
            [request start];
        }
        
        return YES;
    }
    
    return NO;
}

#pragma mark - ASI HTTP Request Delegate


-(void)requestFinished:(ASIHTTPRequest *)request {
    [Settings updateUserName:self.nameTextField.text];
    [SVProgressHUD dismissWithSuccess:@"Naam is opgeslagen" afterDelay:.8];
}


-(void)requestFailed:(ASIHTTPRequest *)request {
    [SVProgressHUD dismissWithError:@"Je internet faalt" afterDelay:.8];
}





@end
