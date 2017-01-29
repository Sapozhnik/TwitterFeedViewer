//
//  RequestConfiguratorProtocol.h
//  TwitterFeedViewer
//
//  Created by alexey on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RequestConfiguratorProtocol <NSObject>

- (NSURLRequest *)requestWithQueryItems:(NSArray<NSURLQueryItem *> *)queryItems;

@end
