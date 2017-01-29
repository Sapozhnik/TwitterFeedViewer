//
//  TweetService.m
//  TwitterFeedViewer
//
//  Created by alexey on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import "TweetService.h"

// Dependencies
#import "RequestConfiguratorProtocol.h"
#import "RequestExecutorProtocol.h"
#import "ResponseMapperProtocol.h"

static NSString *const TwitterAPISearchPathComponents = @"search/tweets.json";

static NSString *const TwitterAPISearchQueryKey = @"q";
static NSString *const TwitterAPISearchCountKey = @"count";
static NSString *const TwitterAPISearchAfterIdKey = @"since_id";

@implementation TweetService
- (void)loadTweetsWithQuery:(NSString *)query
                      count:(NSUInteger)count
                    afterId:(NSString *)afterId
            complitionBlock:(TweetServiceCompletionBlockWithResultObjects)complitionBlock {
    
    NSMutableArray *mutableItems = [NSMutableArray new];
    
    NSURLQueryItem *queryItem = [NSURLQueryItem queryItemWithName:TwitterAPISearchQueryKey
                                                            value:query];
    [mutableItems addObject:queryItem];
    
    NSString *twitterAPISearchCountValue = [NSString stringWithFormat:@"%lu", count];
    NSURLQueryItem *countItem = [NSURLQueryItem queryItemWithName:TwitterAPISearchCountKey
                                                            value:twitterAPISearchCountValue];
    
    [mutableItems addObject:countItem];
    
    if (afterId != nil) {
        NSURLQueryItem *afterIdItem = [NSURLQueryItem queryItemWithName:TwitterAPISearchAfterIdKey
                                                                  value:afterId];
        [mutableItems addObject:afterIdItem];
    }
    
    NSURLRequest *feedRequest = [self.requestConfigurator requestWithPathComponent:TwitterAPISearchPathComponents
                                                                        queryItems:[mutableItems copy]];
    
    __weak typeof(self) wSelf = self;
    [self.requestExecutor performRequest:feedRequest
                          withCompletion:^(id data, NSError *error) {
                              __weak typeof(wSelf) sSelf = wSelf;
                              
                              NSError *serializationError = nil;
                              
                              NSDictionary * responseObject = [NSJSONSerialization JSONObjectWithData:data
                                                                                              options:0
                                                                                                error:&serializationError];
                              if (serializationError != nil) {
                                  complitionBlock(nil, serializationError);
                                  return;
                              }
                              
                              NSArray<Tweet *> *tweets = [sSelf.responseMapper tweetsFromResponse:responseObject];
                              dispatch_async(dispatch_get_main_queue(), ^{
                                  complitionBlock(tweets, nil);
                              });
                          }];
}

@end
