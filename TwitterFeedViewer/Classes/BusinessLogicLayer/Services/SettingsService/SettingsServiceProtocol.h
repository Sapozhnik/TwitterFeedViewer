//
//  SettingsServiceProtocol.h
//  TwitterFeedViewer
//
//  Created by alexey on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SettingsServiceProtocol <NSObject>

- (BOOL)shouldShowUsersPhoto;
- (void)saveShowingUsersPhotoFlag:(BOOL)shouldShowUsersPhoto;

@end
