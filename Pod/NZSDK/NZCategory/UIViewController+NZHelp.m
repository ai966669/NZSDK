//
//  UIViewController+NZHelp.m
//  BWW
//
//  Created by ai966669 on 2016/12/24.
//  Copyright © 2016年 ai966669. All rights reserved.
//

#import "UIViewController+NZHelp.h"

@implementation UIViewController (NZHelp)

- (void)addCancelButtonAsRightBarButtonItem {
    UIButton *btnCancel = [[UIButton alloc] initWithFrame:(CGRect){0,0,40,28}];
    [btnCancel setTitle:@"取消" forState:UIControlStateNormal];
    [btnCancel setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [btnCancel addTarget:self action:@selector(nz_action_CancelButtonAsRightBarButtonItem) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnCancel];
}

- (void)nz_action_CancelButtonAsRightBarButtonItem{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
