//
//  CellObjectProtocol.h
//  TwitterFeedViewer
//
//  Created by alexey on 29/01/2017.
//  Copyright © 2017 ASapozhnik. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UINib;

@protocol CellObjectProtocol <NSObject>

- (Class)cellClass;
- (UINib *)cellNib;

@end
