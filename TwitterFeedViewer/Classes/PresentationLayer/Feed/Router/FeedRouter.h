//
//  FeedRouter.h
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 28/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import "FeedRouterInput.h"

@protocol RamblerViperModuleTransitionHandlerProtocol;

@interface FeedRouter : NSObject <FeedRouterInput>

@property (nonatomic, weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

@end
