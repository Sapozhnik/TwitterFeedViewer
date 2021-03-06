//
//  TweetService.h
//  TwitterFeedViewer
//
//  Created by alexey on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <Foundation/Foundation.h>

// Protocols
#import "TweetServiceProtocol.h"

@protocol RequestConfiguratorProtocol;
@protocol RequestExecutorProtocol;
@protocol ResponseMapperProtocol;

@interface TweetService : NSObject <TweetServiceProtocol>

@property (nonatomic, strong) id<RequestConfiguratorProtocol> requestConfigurator;
@property (nonatomic, strong) id<RequestExecutorProtocol> requestExecutor;
@property (nonatomic, strong) id<ResponseMapperProtocol> responseMapper;

@end
