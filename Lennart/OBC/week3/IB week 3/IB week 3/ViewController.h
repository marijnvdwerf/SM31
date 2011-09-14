//
//  ViewController.h
//  IB week 3
//
//  Created by Lennart van Mourik on 14-09-11.
//  Copyright (c) 2011 -. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource> {
    UIPickerView *singlePicker;
    NSArray * daderArray;
    NSArray * wapenArray;
    NSArray * motiefArray;
    NSString * dader;
    NSString * wapen;
    NSString * motief;
}

@property (nonatomic,retain) IBOutlet UIPickerView *singlePicker;
@property (nonatomic,retain) NSArray *daderArray;
@property (nonatomic,retain) NSArray *wapenArray;
@property (nonatomic,retain) NSArray *motiefArray;

- (IBAction)makePlot:(id)sender;


@end
