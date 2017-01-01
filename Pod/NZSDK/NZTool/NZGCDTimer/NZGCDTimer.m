//
//  NZGCDTimer.m
//  NZZUiKit
//
//  Created by ai966669 on 2016/12/21.
//  Copyright © 2016年 ai966669. All rights reserved.
//

#import "NZGCDTimer.h"

@interface NZGCDTimer () {
    dispatch_source_t _timerCount;
}

@end

@implementation NZGCDTimer

- (void)createGCDTimerWithBlock:(dispatch_block_t)block period:(NSTimeInterval)period {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    _timerCount = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timerCount, dispatch_walltime(NULL, 0), period * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timerCount, block);
}

- (void)stop {
    dispatch_source_cancel(_timerCount);
}

- (void)start {
    dispatch_resume(_timerCount);
}

@end
