//
//  FeedPresenter.h
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 28/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import "FeedViewOutput.h"
#import "FeedInteractorOutput.h"
#import "FeedModuleInput.h"

#import "SettingsModuleOutput.h"

@protocol FeedViewInput;
@protocol FeedInteractorInput;
@protocol FeedRouterInput;

@interface FeedPresenter : NSObject <FeedModuleInput, FeedViewOutput, FeedInteractorOutput, SettingsModuleOutput>

@property (nonatomic, weak) id<FeedViewInput> view;
@property (nonatomic, strong) id<FeedInteractorInput> interactor;
@property (nonatomic, strong) id<FeedRouterInput> router;

@property (nonatomic, copy) NSString *searchQuery;
@property (nonatomic, copy) NSNumber *searchQueryPageSize;

@property (nonatomic, copy) NSNumber *updateTimeInterval;

@end
