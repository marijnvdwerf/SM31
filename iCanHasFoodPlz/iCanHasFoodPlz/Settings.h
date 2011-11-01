//
//  Settings.h
//  iCanHasFoodPlz
//
//  Created by Marijn van der Werf on 31-10-11.
//  Copyright (c) 2011 Fontys Hogeschool ICT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Settings : NSObject

+ (NSString *)userId;

+ (NSString *)userName;
+ (void)updateUserName:(NSString *)newName;
@end
