//
//  RequestExecutor.h
//  TwitterFeedViewer
//
//  Created by alexey on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <Foundation/Foundation.h>

// Protocols
#import "RequestExecutorProtocol.h"

@interface RequestExecutor : NSObject <RequestExecutorProtocol>

@property (nonatomic, strong) NSURLSession *session;

@end
