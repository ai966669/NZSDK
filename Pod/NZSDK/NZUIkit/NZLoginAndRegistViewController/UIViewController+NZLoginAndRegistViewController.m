//
//  UIViewController+NZLoginAndRegistViewController.m
//  BWW
//
//  Created by ai966669 on 2016/12/21.
//  Copyright © 2016年 ai966669. All rights reserved.
//

#import "UIViewController+NZLoginAndRegistViewController.h"

@implementation UIViewController (NZLoginAndRegistViewController)

- (void)configRegistKeyboard {
    self.view.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(NZLoginAndRegistViewController_ResignFirstResponder)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:tap];
}

- (void)NZLoginAndRegistViewController_ResignFirstResponder {
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

@end
