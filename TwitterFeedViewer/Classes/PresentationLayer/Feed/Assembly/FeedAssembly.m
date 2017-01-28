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
                          }];
}

- (FeedRouter *)routerFeed{
    return [TyphoonDefinition withClass:[FeedRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewFeed]];
                          }];
}

@end
