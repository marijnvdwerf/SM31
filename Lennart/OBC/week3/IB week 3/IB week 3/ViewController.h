//
//  ViewController.h
//  IB week 3
//
//  Created by Lennart van Mourik on 14-09-11.
//  Copyright (c) 2011 -. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDelegate,UIPickerViewDataSource>{
    UIPickerView * singlePicker;
    NSArray * pickerData;
}

@property (nonatomic,retain) IBOutlet UIPickerView *singlePicker;
@property (nonatomic,retain) NSArray *pickerData;

@end
