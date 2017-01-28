//
//  FeedInteractor.h
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 28/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import "FeedInteractorInput.h"

@protocol FeedInteractorOutput;

@interface FeedInteractor : NSObject <FeedInteractorInput>

@property (nonatomic, weak) id<FeedInteractorOutput> output;

@end
