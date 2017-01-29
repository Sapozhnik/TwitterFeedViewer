//
//  ServicesAssemblyProtocol.h
//  TwitterFeedViewer
//
//  Created by alexey on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TweetServiceProtocol;
@protocol SettingsServiceProtocol;

@protocol ServicesAssemblyProtocol <NSObject>

- (id<TweetServiceProtocol>)tweetService;
- (id<SettingsServiceProtocol>)settingsService;

@end
