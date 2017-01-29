//
//  DetailTweetAssembly_Testable.h
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import "DetailTweetAssembly.h"

@class DetailTweetViewController;
@class DetailTweetInteractor;
@class DetailTweetPresenter;
@class DetailTweetRouter;

/**
 @author a.sapozhnik

 Extension, который делает приватные методы фабрики открытыми для тестирования. 
 */
@interface DetailTweetAssembly ()

- (DetailTweetViewController *)viewDetailTweet;
- (DetailTweetPresenter *)presenterDetailTweet;
- (DetailTweetInteractor *)interactorDetailTweet;
- (DetailTweetRouter *)routerDetailTweet;

@end
