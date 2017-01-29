//
//  TweetCellObject.h
//  TwitterFeedViewer
//
//  Created by alexey on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TweetCellObject : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *authorName;
@property (nonatomic, copy) NSURL *profileImageURL;
@property (nonatomic, assign) BOOL showImage;

@end
