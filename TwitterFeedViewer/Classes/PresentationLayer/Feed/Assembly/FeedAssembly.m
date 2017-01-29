//
//  FeedAssembly.m
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 28/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import "FeedAssembly.h"

#import "FeedViewController.h"
#import "FeedInteractor.h"
#import "FeedPresenter.h"
#import "FeedRouter.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

// Dependencies
#import "ServicesAssemblyProtocol.h"

static NSString *const FeedConfigFileName = @"FeedConfig.plist";
static NSString *const FeedConfigTwitterSearchQueryKey = @"TwitterSearchQuery";
static NSString *const FeedConfigTwitterSearchQueryPageSizeKey = @"TwitterSearchQueryPageSize";

@interface FeedAssembly ()

@property (nonatomic, strong, readonly) TyphoonAssembly<ServicesAssemblyProtocol> *servicesAssembly;

@end

@implementation FeedAssembly

- (FeedViewController *)viewFeed {
    return [TyphoonDefinition withClass:[FeedViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterFeed]];
                              [definition injectProperty:@selector(moduleInput)
                                                    with:[self presenterFeed]];
                          }];
}

- (FeedInteractor *)interactorFeed {
    return [TyphoonDefinition withClass:[FeedInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterFeed]];
                              [definition injectProperty:@selector(tweetService)
                                                    with:[self.servicesAssembly tweetService]];
                          }];
}

- (FeedPresenter *)presenterFeed{
    return [TyphoonDefinition withClass:[FeedPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewFeed]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorFeed]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerFeed]];
                              
                              [definition injectProperty:@selector(searchQuery)
                                                    with:TyphoonConfig(FeedConfigTwitterSearchQueryKey)];
                              [definition injectProperty:@selector(searchQueryPageSize)
                                                    with:TyphoonConfig(FeedConfigTwitterSearchQueryPageSizeKey)];
                          }];
}

- (FeedRouter *)routerFeed{
    return [TyphoonDefinition withClass:[FeedRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewFeed]];
                          }];
}

#pragma mark - Config

- (id)configurer {
    id result = [TyphoonDefinition withConfigName:FeedConfigFileName
                                           bundle:[self currentBundle]];
    return result;
}

- (NSBundle *)currentBundle {
    return [NSBundle bundleForClass:[self class]];
}

@end
