//
//  DetailTweetRouter.h
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import "DetailTweetRouterInput.h"

@protocol RamblerViperModuleTransitionHandlerProtocol;

@interface DetailTweetRouter : NSObject <DetailTweetRouterInput>

@property (nonatomic, weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

@end
