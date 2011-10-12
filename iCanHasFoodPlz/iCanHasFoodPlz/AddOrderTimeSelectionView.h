//
//  AddOrderTimeSelectionView.h
//  iCanHasFoodPlz
//
//  Created by Lennart van Mourik on 12-10-11.
//  Copyright (c) 2011 Fontys Hogeschool ICT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddOrderTimeSelectionView : UITableViewController
<UITableViewDataSource,UITableViewDelegate>
{
    
}

@property (nonatomic, retain) NSArray *tableData;

@property (nonatomic, retain) NSDate *time;

@end
