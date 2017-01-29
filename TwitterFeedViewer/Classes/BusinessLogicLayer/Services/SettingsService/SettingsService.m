//
//  SettingsService.m
//  TwitterFeedViewer
//
//  Created by alexey on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import "SettingsService.h"

static NSString *const SettingsServiceShowUsersPhotoFlagKey = @"SettingsServiceShowUsersPhotoFlag";

@implementation SettingsService

- (BOOL)shouldShowUsersPhoto {
    return [self.userDefaults boolForKey:SettingsServiceShowUsersPhotoFlagKey];
}

- (void)saveShowingUsersPhotoFlag:(BOOL)shouldShowUsersPhoto {
    [self.userDefaults setBool:shouldShowUsersPhoto
                        forKey:SettingsServiceShowUsersPhotoFlagKey];
    [self.userDefaults synchronize];
}

@end
