//
//  ServicesAssembly.m
//  TwitterFeedViewer
//
//  Created by alexey on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import "ServicesAssembly.h"

// Services
#import "TweetService.h"
#import "SettingsService.h"

// Dependencies
#import "CoreComponentsAssemblyProtocol.h"

@interface ServicesAssembly ()

@property (nonatomic, strong, readonly) TyphoonAssembly<CoreComponentsAssemblyProtocol> *coreComponentsAssembly;

@end

@implementation ServicesAssembly

- (id<TweetServiceProtocol>)tweetService {
    return [TyphoonDefinition withClass:[TweetService class]
            configuration:^(TyphoonDefinition *definition) {
                [definition injectProperty:@selector(requestConfigurator)
                                      with:[self.coreComponentsAssembly requestConfigurator]];
                [definition injectProperty:@selector(requestExecutor)
                                      with:[self.coreComponentsAssembly requestExecutor]];
                [definition injectProperty:@selector(responseMapper)
                                      with:[self.coreComponentsAssembly tweetFeedResponseMapper]];
            }];
}

- (id<SettingsServiceProtocol>)settingsService {
    return [TyphoonDefinition withClass:[SettingsService class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(userDefaults)
                                                    with:[self userDefaults]];
                          }];
}

#pragma mark - Private

- (NSUserDefaults *)userDefaults {
    return [TyphoonDefinition withClass:[NSUserDefaults class]
            configuration:^(TyphoonDefinition *definition) {
                [definition useInitializer:@selector(standardUserDefaults)];
                definition.scope = TyphoonScopeSingleton;
            }];
}

@end
