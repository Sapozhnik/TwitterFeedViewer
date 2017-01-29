//
//  ResponseDeserializerProtocol.h
//  TwitterFeedViewer
//
//  Created by alexey on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^DeserializerCompletionBlock)(NSDictionary *response, NSError *error);

@protocol ResponseDeserializerProtocol <NSObject>

- (void)deserializeServerResponse:(NSData *)responseData
                  completionBlock:(DeserializerCompletionBlock)completionBlock;

@end
