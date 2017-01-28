//
//  FeedAssembly_Testable.h
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 28/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import "FeedAssembly.h"

@class FeedViewController;
@class FeedInteractor;
@class FeedPresenter;
@class FeedRouter;

/**
 @author a.sapozhnik

 Extension, который делает приватные методы фабрики открытыми для тестирования. 
 */
@interface FeedAssembly ()

- (FeedViewController *)viewFeed;
- (FeedPresenter *)presenterFeed;
- (FeedInteractor *)interactorFeed;
- (FeedRouter *)routerFeed;

@end
