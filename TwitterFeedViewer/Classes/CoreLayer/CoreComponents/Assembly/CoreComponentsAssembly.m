//
//  CoreComponentsAssembly.m
//  TwitterFeedViewer
//
//  Created by alexey on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import "CoreComponentsAssembly.h"

// Core components
#import "RequestConfigurator.h"
#import "RequestExecutor.h"
#import "ResponseMapper.h"

#import "MappingProvider.h"

static NSString *const APIConfigFileName = @"APIConfig.plist";
static NSString *const TwitterAPIBaseURLKey = @"TwitterAPIBaseURL";
static NSString *const TwitterBearerTokenKey = @"TwitterBearerToken";

@implementation CoreComponentsAssembly

- (id<RequestConfiguratorProtocol>)requestConfigurator {
    return [TyphoonDefinition withClass:[RequestConfigurator class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(baseURL)
                                                    with:TyphoonConfig(TwitterAPIBaseURLKey)];
                              
                              [definition injectProperty:@selector(bearerToken)
                                                    with:TyphoonConfig(TwitterBearerTokenKey)];//¯\_(ツ)_/¯
                          }];
}

- (id<RequestExecutorProtocol>)requestExecutor {
    return [TyphoonDefinition withClass:[RequestExecutor class]
                          configuration:^(TyphoonDefinition *definition)
            {
                [definition injectProperty:@selector(session)
                                      with:[NSURLSession sharedSession]];
            }];
}

- (id<ResponseMapperProtocol>)tweetFeedResponseMapper {
    return [TyphoonDefinition withClass:[ResponseMapper class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(tweetMappingProvider)
                                                    with:[self mappingProvider]];
                          }];
}

#pragma mark - Private

- (MappingProvider *)mappingProvider {
    return [TyphoonDefinition withClass:[MappingProvider class]];
}

#pragma mark - Config

- (id)configurer {
    id result = [TyphoonDefinition withConfigName:APIConfigFileName
                                           bundle:[self currentBundle]];
    return result;
}

- (NSBundle *)currentBundle {
    return [NSBundle bundleForClass:[self class]];
}

@end
