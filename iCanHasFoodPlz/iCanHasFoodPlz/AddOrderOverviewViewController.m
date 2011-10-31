//
//  AddOrderOverviewViewController.m
//  iCanHasFoodPlz
//
//  Created by Lennart van Mourik on 12-10-11.
//  Copyright (c) 2011 Fontys Hogeschool ICT. All rights reserved.
//

#import "AddOrderOverviewViewController.h"
#import "Order.h"
#import "ASIFormDataRequest.h"
#import "SVProgressHUD.h"
#import "Settings.h"


@implementation AddOrderOverviewViewController

@synthesize order = _order, itemInfo = _itemInfo, volunteerSwitch = _volunteerSwitch;

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
    
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    cachePath = [cachePath stringByAppendingPathComponent:@"items.plist"];
    self.itemInfo = [[NSDictionary alloc] initWithContentsOfFile:cachePath];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
    
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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rows;
    
    switch (section) {
        case 0:
            // Top section contains a row for each item.
            rows = [self.order.items count];
            break;
        case 1:
        default:
            rows = 2;
            break;
    }
    
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = @"AddOrderItemCell";
    
    if (indexPath.section == 1 && indexPath.row == 0) {
        CellIdentifier = @"AddOrderTimeSelectionCell";
    } else if (indexPath.section == 1 && indexPath.row == 1) {
        CellIdentifier = @"AddOrderVolunteerCell";
    }
    
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if(indexPath.section == 0) {
         // Top section contains a row for each item.
        NSArray *allItemIds = [self.order.items allKeys];
        NSDictionary *currentItemInfo = [self.itemInfo objectForKey:[allItemIds objectAtIndex:indexPath.row]];
        cell.textLabel.text = [currentItemInfo objectForKey:@"name"];
    }
    
    if (indexPath.section == 1 && indexPath.row == 0) {
        cell.textLabel.text = @"Wanneer";
        cell.detailTextLabel.text = @"default";
    }
    
    if (indexPath.section == 1 && indexPath.row == 1) {
        cell.textLabel.text = @"Halen";
        self.volunteerSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
        cell.accessoryView = self.volunteerSwitch;
        
        [(UISwitch *)cell.accessoryView setOn:YES];
    }

   
    

    
    
    
    
    
    // Configure the cell...
    
    return cell;
}
#pragma test

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

- (IBAction)sendOrderToServer:(id)sender {
    NSURL *url = [[NSURL alloc] initWithString:@"http://school.navale.nl/p5/icanhasfood/addOrder.php"];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request setDelegate:self];
    [request setPostValue:[Settings userId] forKey:@"user"];
    
    // Items versturen
    NSData *itemData = [NSJSONSerialization dataWithJSONObject:self.order.items options:NSJSONWritingPrettyPrinted error:nil];
    
    
    
    NSString *itemJson = [[NSString alloc] initWithData:itemData                                        
                          encoding:NSUTF8StringEncoding];
    
    [request setPostValue:itemJson forKey:@"items"];
    
    
    // Halen of niet
    if (self.volunteerSwitch.on){
        // Naar server sturen dat gebruiker kan halen
        [request setPostValue:@"true" forKey:@"volunteer"];
    }
    else {
        // Naar server sturen dat gebruiker NIET kan halen
        [request setPostValue:@"false" forKey:@"volunteer"];
    }
    [request startAsynchronous];
    
    //HUD
    [SVProgressHUD showInView:self.view];
    
}

- (void)requestFinished:(ASIHTTPRequest *)request {
    [SVProgressHUD dismissWithSuccess:@"Succesvol"];
}

- (void) requestFailed:(ASIHTTPRequest *)request {
    NSLog(@"%@", request.responseStatusMessage);
    [SVProgressHUD dismissWithError:@"Verbindingsfout"];
}


@end
