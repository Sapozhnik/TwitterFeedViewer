//
//  SettingsService.h
//  TwitterFeedViewer
//
//  Created by alexey on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <Foundation/Foundation.h>

// Protocols
#import "SettingsServiceProtocol.h"

@interface SettingsService : NSObject <SettingsServiceProtocol>

@property (nonatomic, strong) NSUserDefaults *userDefaults;

@end
