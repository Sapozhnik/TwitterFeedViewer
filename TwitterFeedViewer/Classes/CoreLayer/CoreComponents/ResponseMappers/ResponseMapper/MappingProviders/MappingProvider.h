//
//  MappingProvider.h
//  TwitterFeedViewer
//
//  Created by alexey on 28/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <Foundation/Foundation.h>

// Protocols
#import "MappingProviderProtocol.h"

@class EKObjectMapping;

@interface MappingProvider : NSObject <MappingProviderProtocol>

@property (nonatomic, strong) NSDateFormatter *tweetDateFormatter;

@end
