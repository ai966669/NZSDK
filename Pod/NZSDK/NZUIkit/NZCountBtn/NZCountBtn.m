//
//  NZCountBtn.m
//  NZZUiKit
//
//  Created by ai966669 on 2016/12/20.
//  Copyright © 2016年 ai966669. All rights reserved.
//

#import "NZCountBtn.h"
#import "NZGCDTimer.h"
#import "UIColor+NZHelp.h"

static int const kDefaultCountNumber = 10;

@interface NZCountBtn() {
    NZGCDTimer *gcdtimer;
    int _countNow;
    UIColor *_normlColor;
}

@end

@implementation NZCountBtn

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (instancetype)init
{
    self = [super init];
    if (self) {
        _count = kDefaultCountNumber;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _count = kDefaultCountNumber;
//        [self addTarget:self action:@selector(startCount) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)startCount {
    self.enabled = NO;
    _title = self.titleLabel.text;
    _normlColor = self.backgroundColor;
    [self setBackgroundColor:[UIColor colorWithHex:0xdbdbdb]];
    [self configTimer];
    [gcdtimer start];
}

- (void)counting {
    if (!_countNow) {
        self.enabled = YES;
        [gcdtimer stop];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self setTitle:_title forState:UIControlStateNormal];
            [self setBackgroundColor:_normlColor];
        });
    } else {
        _countNow --;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self setTitle:[NSString stringWithFormat:@"%d",_countNow] forState:UIControlStateNormal];
        });
    }
}

- (void)setCount:(int)count {
    _count = count;
    [self setTitle:[NSString stringWithFormat:@"%d",_count] forState:UIControlStateNormal];
}

- (void)setTitle:(NSString *)title {
    [self setTitle:title forState:UIControlStateNormal];
}

- (void)configTimer {
    if (gcdtimer) {
        [gcdtimer stop];
    }
    _countNow = _count;
    gcdtimer = [[NZGCDTimer alloc] init];
    __weak typeof(self) weakSelf = self;
    [gcdtimer createGCDTimerWithBlock:^{
        [weakSelf counting];
    } period:1];
}

@end
