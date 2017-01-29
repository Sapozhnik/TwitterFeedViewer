//
//  ResponseMapper.m
//  TwitterFeedViewer
//
//  Created by alexey on 28/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import "ResponseMapper.h"

// Libraries
#import <EasyMapping/EasyMapping.h>

// Entities
#import "Tweet.h"

// Dependencies
#import "MappingProviderProtocol.h"

static NSString *const TFVResponseStatusesRootKey = @"statuses";

@implementation ResponseMapper

- (NSArray<Tweet *> *)tweetsFromResponse:(NSDictionary<NSString *, NSArray *> *)response {
    NSArray *statusesArray = response[TFVResponseStatusesRootKey];
    NSArray *carsArray = [EKMapper arrayOfObjectsFromExternalRepresentation:statusesArray
                                                                withMapping:self.tweetMappingProvider.tweetMapping];
    return carsArray;
}

@end
