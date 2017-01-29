//
//  MappingProvider.m
//  TwitterFeedViewer
//
//  Created by alexey on 28/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import "MappingProvider.h"

// Libraries
#import <EasyMapping/EasyMapping.h>

// Entities
#import "Tweet.h"
#import "User.h"

@interface MappingProvider ()

@property (nonatomic, strong) NSDateFormatter *tweetDateFormatter;

@end

@implementation MappingProvider

- (instancetype)init {
    self = [super init];
    
    if (self != nil) {
        _tweetDateFormatter = [NSDateFormatter new];
        _tweetDateFormatter.dateFormat = @"EEE MMM dd HH:mm:ss Z yyyy"; //Sat Jan 28 17:47:39 +0000 2017
    }
    
    return self;
}

- (EKObjectMapping *)tweetMapping {
    return [EKObjectMapping mappingForClass:[Tweet class]
                                  withBlock:^(EKObjectMapping *mapping) {
                                      [mapping mapKeyPath:@"id_str"
                                               toProperty:NSStringFromSelector(@selector(tweetId))];
                                      
                                      [mapping mapKeyPath:@"text"
                                               toProperty:NSStringFromSelector(@selector(text))];
                                      
                                      [mapping mapKeyPath:@"created_at"
                                               toProperty:NSStringFromSelector(@selector(date))
                                        withDateFormatter:self.tweetDateFormatter];
                                      
                                      [mapping hasOne:[User class]
                                           forKeyPath:@"user"
                                          forProperty:NSStringFromSelector(@selector(user))
                                    withObjectMapping:[self userMapping]];
                                  }];
}

#pragma mark - Private

- (EKObjectMapping *)userMapping {
    return [EKObjectMapping mappingForClass:[User class]
                                  withBlock:^(EKObjectMapping *mapping) {
                                      [mapping mapKeyPath:@"name"
                                               toProperty:NSStringFromSelector(@selector(name))];
                                      
                                      [mapping mapKeyPath:@"profile_image_url"
                                               toProperty:NSStringFromSelector(@selector(profileImageURL))
                                           withValueBlock:^id(NSString *key, id value) {
                                               return [NSURL URLWithString:value];
                                           }];
                                  }];
}

@end
