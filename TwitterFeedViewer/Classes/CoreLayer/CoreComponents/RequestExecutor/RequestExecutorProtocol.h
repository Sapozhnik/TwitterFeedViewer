//
//  RequestExecutorProtocol.h
//  TwitterFeedViewer
//
//  Created by alexey on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^RequestExecutionCompletionBlock)(id data, NSError *error);

@protocol RequestExecutorProtocol <NSObject>

- (void)performRequest:(NSURLRequest *)request
        withCompletion:(RequestExecutionCompletionBlock)completionBlock;

@end
