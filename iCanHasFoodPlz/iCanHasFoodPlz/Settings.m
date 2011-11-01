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

+ (NSString *)userName {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *userName = [defaults objectForKey:@"userName"];
    
    if(userName == nil) {
        userName = @"-";
        [defaults setValue:userName forKey:@"userName"];
        [defaults synchronize];
    }
    
    return userName;
}

+ (void)updateUserName:(NSString *)newName {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setValue:newName forKey:@"userName"];
    [defaults synchronize];
}
@end
