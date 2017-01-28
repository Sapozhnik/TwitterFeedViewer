//
//  Tweet.h
//  TwitterFeedViewer
//
//  Created by alexey on 28/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@interface Tweet : NSObject

@property (nonatomic, copy) NSString *tweetId;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSDate *date;
@property (nonatomic, strong) User *user;

@end
