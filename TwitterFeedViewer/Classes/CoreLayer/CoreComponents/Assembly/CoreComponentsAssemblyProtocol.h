//
//  CoreComponentsAssemblyProtocol.h
//  TwitterFeedViewer
//
//  Created by alexey on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RequestConfiguratorProtocol;
@protocol RequestExecutorProtocol;
@protocol ResponseMapperProtocol;

@protocol CoreComponentsAssemblyProtocol <NSObject>

- (id<RequestConfiguratorProtocol>)requestConfigurator;
- (id<RequestExecutorProtocol>)requestExecutor;
- (id<ResponseMapperProtocol>)tweetFeedResponseMapper;

@end
