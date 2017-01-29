//
//  TweetServiceProtocol.h
//  TwitterFeedViewer
//
//  Created by alexey on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Tweet;

typedef void (^TweetServiceCompletionBlockWithResultObjects)(NSArray<Tweet *> *tweets, NSError *error);

@protocol TweetServiceProtocol <NSObject>

- (void)loadTweetsWithQuery:(NSString *)query
                    afterId:(NSString *)afterId
            complitionBlock:(TweetServiceCompletionBlockWithResultObjects)complitionBlock;

@end
