//
//  ResponseMapperProtocol.h
//  TwitterFeedViewer
//
//  Created by alexey on 28/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Tweet;

@protocol ResponseMapperProtocol <NSObject>

- (NSArray<Tweet *> *)tweetsFromResponse:(NSDictionary<NSString *, NSArray *> *)response;

@end
