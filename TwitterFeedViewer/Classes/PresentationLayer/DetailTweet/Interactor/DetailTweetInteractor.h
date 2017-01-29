//
//  DetailTweetInteractor.h
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import "DetailTweetInteractorInput.h"

@protocol DetailTweetInteractorOutput;

@interface DetailTweetInteractor : NSObject <DetailTweetInteractorInput>

@property (nonatomic, weak) id<DetailTweetInteractorOutput> output;

@end
