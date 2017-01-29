//
//  RequestExecutor.m
//  TwitterFeedViewer
//
//  Created by alexey on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import "RequestExecutor.h"

@implementation RequestExecutor

- (void)performRequest:(NSURLRequest *)request
        withCompletion:(RequestExecutionCompletionBlock)completionBlock {
    
    NSAssert(request != nil, @"NSURLRequest mustn't be nil");
    
    NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (completionBlock) {
            completionBlock(data, error);
        }
    }];
    
    [dataTask resume];
}

@end
