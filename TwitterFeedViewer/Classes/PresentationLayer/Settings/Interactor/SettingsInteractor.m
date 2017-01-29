//
//  SettingsInteractor.m
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import "SettingsInteractor.h"

#import "SettingsInteractorOutput.h"

#import "SettingsServiceProtocol.h"

@implementation SettingsInteractor

#pragma mark - Методы SettingsInteractorInput

- (BOOL)obtainShowUsersPhotoFlag {
    return [self.settingsService shouldShowUsersPhoto];
}

- (void)updateShowingUsersPhotoFlag:(BOOL)shouldShowUsersPhoto {
    [self.settingsService saveShowingUsersPhotoFlag:shouldShowUsersPhoto];
}

@end
