//
//  DetailTweetAssembly.m
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import "DetailTweetAssembly.h"

#import "DetailTweetViewController.h"
#import "DetailTweetInteractor.h"
#import "DetailTweetPresenter.h"
#import "DetailTweetRouter.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation DetailTweetAssembly

- (DetailTweetViewController *)viewDetailTweet {
    return [TyphoonDefinition withClass:[DetailTweetViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterDetailTweet]];
                              [definition injectProperty:@selector(moduleInput)
                                                    with:[self presenterDetailTweet]];
                          }];
}

- (DetailTweetInteractor *)interactorDetailTweet {
    return [TyphoonDefinition withClass:[DetailTweetInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterDetailTweet]];
                          }];
}

- (DetailTweetPresenter *)presenterDetailTweet{
    return [TyphoonDefinition withClass:[DetailTweetPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewDetailTweet]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorDetailTweet]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerDetailTweet]];
                          }];
}

- (DetailTweetRouter *)routerDetailTweet{
    return [TyphoonDefinition withClass:[DetailTweetRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewDetailTweet]];
                          }];
}

@end
