//
//  ShoppingListDetailsViewController.m
//  iCanHasFoodPlz
//
//  Created by Marijn van der Werf on 02-11-11.
//  Copyright (c) 2011 Fontys Hogeschool ICT. All rights reserved.
//

// TODO
// Prijzen opgeven
// Kaartoverzicht
// Losse gebruikers-lijstjes
// Aantal boodschappen
// Wegstrepen


#import "ShoppingListDetailsViewController.h"


@implementation ShoppingListDetailsViewController
@synthesize shoppingList = _shoppingList, itemDetails = _itemDetails;

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
 
    // Load item dicionary form cache
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    cachePath = [cachePath stringByAppendingPathComponent:@"items.plist"];
    self.itemDetails = [[NSDictionary alloc] initWithContentsOfFile:cachePath];
    
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
    
    // Scroll the table view to the top before it appears
    [self.tableView reloadData];
    [self.tableView setContentOffset:CGPointZero animated:NO];
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
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSInteger rows = 0;
    
    switch(section) {
        case 0:
            // Show the shopping list in the first section
            rows = [self.shoppingList.items count];
            break;
        case 1:
            // Show the user list in the second section
            rows = [self.shoppingList.users count];
            break;
    }
    return rows;
}

- (UITableViewCell *)getCellForIdentifier:(NSString *)identifier {
    if(!identifier) {
        identifier = @"Cell";
    }
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    switch (indexPath.section) {
        case 0:
            {
            // Boodschappenlijst
            cell = [self getCellForIdentifier:@"ShoppingListItemCell"];
            
            NSDictionary *listItem =  [self.shoppingList.items objectAtIndex:indexPath.row];
            NSDictionary *itemInfo = [self.itemDetails objectForKey:[listItem objectForKey:@"item_id"]];
            
            cell.textLabel.text = [itemInfo objectForKey:@"name"];   
            break;
            }
        case 1:
            {
            // Gebruikerslijst
            cell = [self getCellForIdentifier:@"ShoppingListUserCell"];
           
            // (laten verwijzen naar hun boodschappenlijstje, met knop om aan tegeven dat betaald is bijv.)
            NSDictionary *user = [self.shoppingList.users objectAtIndex:indexPath.row];
            cell.textLabel.text = [user objectForKey:@"name"];
            break;
            }
        default:
            return [self getCellForIdentifier:nil];
            break;
    }
    
    return cell;
}

@end
