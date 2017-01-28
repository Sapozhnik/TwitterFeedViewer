//
//  Tweet.h
//  TwitterFeedViewer
//
//  Created by alexey on 28/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tweet : NSObject

@property (nonatomic, copy) NSString *tweetId;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *authorName;
@property (nonatomic, copy) NSString *profileImageLink;

@end
