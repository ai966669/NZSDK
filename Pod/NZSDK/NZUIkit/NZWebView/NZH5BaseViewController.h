//
//  NZH5BaseViewController.h
//  BWW
//
//  Created by ai966669 on 2016/12/7.
//  Copyright © 2016年 ai966669. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NZH5BaseViewController : UIViewController <UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) NSString *urlString;
- (instancetype)initWithURLString:(NSString *)urlString;
- (void)configRequest:(NSMutableURLRequest *)request;
@end
