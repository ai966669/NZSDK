//
//  WDWebViewProgressViewController.m
//  Uban
//
//  Created by chenyi on 7/21/16.
//  Copyright © 2016 shinemo. All rights reserved.
//

#import "WDWebViewProgressViewController.h"

@interface WDWebViewProgressViewController ()
@property (nonatomic, strong) UIProgressView *progressView;
@property (nonatomic, assign) NSTimeInterval fadeOutDelay;
@property (nonatomic, assign) NSTimeInterval fadeOutDuration;
@end

@implementation WDWebViewProgressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.progressView = [[UIProgressView alloc] initWithFrame:self.view.bounds];
    self.progressView.trackTintColor = [UIColor clearColor];
    self.progressView.progressTintColor = [UIColor lightGrayColor];
    [self.view addSubview:self.progressView];

    self.fadeOutDelay = 0.1f;
    self.fadeOutDuration = 0.2f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillLayoutSubviews {
    self.progressView.frame = self.view.bounds;
}

- (void)startProgress {
    self.progressView.progress = 0;
    self.progressView.alpha = 1.0;
    [self autoIncrease];
}

- (void)autoIncrease {
    // 如果进度到百分之95还没加载完，停止进度条自动增长。
    if (self.progressView.progress < 0.95) {
        [self.progressView setProgress:self.progressView.progress + 0.003 animated:YES];
        [self performSelector:@selector(autoIncrease) withObject:nil afterDelay:0.041f];
    }
}

- (void)makeProgress {
    // 发起请求最大的进度上限小于自动增长的上限，留些空间给自动增长。
    if (self.progressView.progress < 0.65) {
        [self.progressView setProgress:self.progressView.progress + 0.10 animated:YES];
    }
}

- (void)finishProgress {
    [self.progressView setProgress:1 animated:NO];
    [UIView animateWithDuration:self.fadeOutDuration
                          delay:self.fadeOutDelay
                        options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.progressView.alpha = 0.0;
    } completion:^(BOOL finished){
    }];
}

@end
