//
//  Settings.m
//  iCanHasFoodPlz
//
//  Created by Marijn van der Werf on 31-10-11.
//  Copyright (c) 2011 Fontys Hogeschool ICT. All rights reserved.
//

#import "Settings.h"

@implementation Settings

+ (NSString *)userId {
    // Store the data
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *userId = [defaults objectForKey:@"userId"];
    
    if(userId == nil) {
        userId = @"3";
        [defaults setValue:userId forKey:@"userId"];
        [defaults synchronize];
    }
    return userId;
}
@end
