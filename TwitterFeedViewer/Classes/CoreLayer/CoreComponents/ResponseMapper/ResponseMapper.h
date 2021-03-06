//
//  ResponseMapper.h
//  TwitterFeedViewer
//
//  Created by alexey on 28/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <Foundation/Foundation.h>

// Protocols
#import "ResponseMapperProtocol.h"

@protocol MappingProviderProtocol;

@interface ResponseMapper : NSObject <ResponseMapperProtocol>

@property (nonatomic, strong) id<MappingProviderProtocol> tweetMappingProvider;

@end
