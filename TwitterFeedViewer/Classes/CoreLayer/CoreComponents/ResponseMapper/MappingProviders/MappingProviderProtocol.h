//
//  MappingProviderProtocol.h
//  TwitterFeedViewer
//
//  Created by alexey on 28/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EKObjectMapping;

@protocol MappingProviderProtocol <NSObject>

- (EKObjectMapping *)tweetMapping;

@end
