//
//  AddOrderItemSelectionView.m
//  iCanHasFoodPlz
//
//  Created by Marijn van der Werf on 05-10-11.
//  Copyright (c) 2011 Fontys Hogeschool ICT. All rights reserved.
//

#import "AddOrderItemSelectionView.h"
#import "ASIHTTPRequest.h"
#import "PullRefreshTableViewController.h"
#import "AddOrderOverviewViewController.h"


@implementation AddOrderItemSelectionView
@synthesize nextButton = _nextButton;

@synthesize items=_items, order=_order;

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
    
    
       
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    cachePath = [cachePath stringByAppendingPathComponent:@"items.plist"];
    NSDictionary *items = [[NSDictionary alloc] initWithContentsOfFile:cachePath];
    
    if(items == nil) {
        [self startLoading];
    } else {
        [self parseItemDictionary:items];
    }
    
    self.order = [[Order alloc] init];
}

- (void)viewDidUnload
{
    [self setNextButton:nil];
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
    return [self.items count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    #warning Incomplete method implementation.
    // Return the number of rows in the section.
    
    /* Create the dictionary. */
    
    NSArray *keys = [self.items allKeys];
    id aKey = [keys objectAtIndex:section];
    NSDictionary *sectionItems = [self.items objectForKey:aKey];
    
    return [sectionItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"orderItemSelectionCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSArray *categories = [self.items allKeys];
    id catKey = [categories objectAtIndex:indexPath.section];
    NSArray *categoryItems = [self.items objectForKey:catKey];
       
    NSDictionary *itemRow = [categoryItems objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [itemRow objectForKey:@"name"];
    
    if([self.order isItemOrdered:[itemRow objectForKey:@"id"]]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    // Configure the cell...
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSArray *keys = [self.items allKeys];
    NSString *title = [keys objectAtIndex:section];
    return title;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *categories = [self.items allKeys];
    id aKey = [categories objectAtIndex:indexPath.section];
    NSArray *sectionItems = [self.items objectForKey:aKey];
    
    NSDictionary *itemRow = [sectionItems objectAtIndex:indexPath.row];
    
    if([self.order isItemOrdered:(NSInteger)[itemRow objectForKey:@"id"]]) {
        // Remove item from order
        [self.order removeItem:(NSInteger)[itemRow objectForKey:@"id"]];
        [[tableView cellForRowAtIndexPath:indexPath] setAccessoryType:UITableViewCellAccessoryNone];
    } else {
        // Add item to order
        [self.order addItem:(NSInteger)[itemRow objectForKey:@"id"]];
        [[tableView cellForRowAtIndexPath:indexPath] setAccessoryType:UITableViewCellAccessoryCheckmark];
    }
    if([self.order.items count] > 0) {
        // Enable Next button
        self.nextButton.enabled = YES;
    } else {
        // Disable Next button
        self.nextButton.enabled = NO;
    }
    
    //self.order
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Pull to Refresh

- (void)refresh {
    NSURL *url = [[NSURL alloc] initWithString:@"http://school.navale.nl/p5/icanhasfood/items.php"];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setDelegate:self];
    [request startAsynchronous];
}

#pragma mark urlrequest

- (void)requestFinished:(ASIHTTPRequest *)request
{
    // Parse returned JSON
    NSDictionary *jsonSerialization = [NSJSONSerialization JSONObjectWithData:[request responseData] options:nil error:nil];
    
    // Cache the dictionary to a plist.
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    cachePath = [cachePath stringByAppendingPathComponent:@"items.plist"];
    [jsonSerialization writeToFile:cachePath atomically:YES];
    
    // Save dictionary to items property
    [self parseItemDictionary:jsonSerialization];
    
    // Stop the pull to refresh spinner
    [self stopLoading];
    
    // Reload table view
    [self.tableView reloadData];
}

- (void)parseItemDictionary:(NSDictionary*)itemDictionary
{
    self.items = [[NSMutableDictionary alloc] init];
    
    for(NSString *itemId in itemDictionary) {
        NSDictionary *item = [itemDictionary objectForKey:itemId];
        
        NSMutableArray *category = [self.items objectForKey:[item objectForKey:@"category"]];
        
        if(category == nil) {
            category = [[NSMutableArray alloc] init];
            [self.items setValue:category forKey:[item objectForKey:@"category"]];
        }
        
        [category addObject:item];
        
    }
    
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([[segue identifier] isEqualToString:@"AddOrderShowOverview"]) {
        AddOrderOverviewViewController *overview = [segue destinationViewController];
        overview.order = self.order;
    }
}

#pragma mark - IBActions

- (IBAction)cancel:(id)sender {
    [[self parentViewController] dismissModalViewControllerAnimated:TRUE];
}
@end
