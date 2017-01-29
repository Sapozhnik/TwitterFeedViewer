//
//  DetailTweetModuleInput.h
//  TwitterFeedViewer
//
//  Created by a.sapozhnik on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ViperMcFlurry/ViperMcFlurry.h>

@class Tweet;

@protocol DetailTweetModuleInput <RamblerViperModuleInput>

/**
 @author a.sapozhnik

 Метод инициирует стартовую конфигурацию текущего модуля
 */
- (void)configureModuleWithTweet:(Tweet *)tweet;;

@end
