//
//  ResponseDeserializer.m
//  TwitterFeedViewer
//
//  Created by alexey on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import "ResponseDeserializer.h"

@implementation ResponseDeserializer

- (void)deserializeServerResponse:(NSData *)responseData
                  completionBlock:(DeserializerCompletionBlock)completionBlock {
    
    NSError *serializationError = nil;
    id responseObject = nil;
    
    responseObject = [NSJSONSerialization JSONObjectWithData:responseData
                                                     options:0
                                                       error:&serializationError];
    
    completionBlock(responseObject, serializationError);
}

@end
