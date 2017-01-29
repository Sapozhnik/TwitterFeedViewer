//
//  DetailTweetViewInput.h
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DetailTweetViewInput <NSObject>

/**
 @author a.sapozhnik

 Метод настраивает начальный стейт view
 */
- (void)setupInitialState;

@end
