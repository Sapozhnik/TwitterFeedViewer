//
//  FeedViewInput.h
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 28/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FeedViewInput <NSObject>

/**
 @author a.sapozhnik

 Метод настраивает начальный стейт view
 */
- (void)setupInitialState;

@end
