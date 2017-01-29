//
//  DetailTweetPresenter.h
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import "DetailTweetViewOutput.h"
#import "DetailTweetInteractorOutput.h"
#import "DetailTweetModuleInput.h"

@protocol DetailTweetViewInput;
@protocol DetailTweetInteractorInput;
@protocol DetailTweetRouterInput;

@interface DetailTweetPresenter : NSObject <DetailTweetModuleInput, DetailTweetViewOutput, DetailTweetInteractorOutput>

@property (nonatomic, weak) id<DetailTweetViewInput> view;
@property (nonatomic, strong) id<DetailTweetInteractorInput> interactor;
@property (nonatomic, strong) id<DetailTweetRouterInput> router;

@end
