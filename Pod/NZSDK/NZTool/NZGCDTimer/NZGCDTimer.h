//
//  NZGCDTimer.h
//  NZZUiKit
//
//  Created by ai966669 on 2016/12/21.
//  Copyright © 2016年 ai966669. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NZGCDTimer : NSObject

- (void)createGCDTimerWithBlock:(dispatch_block_t)block period:(NSTimeInterval)period;

- (void)stop;

- (void)start;

@end
