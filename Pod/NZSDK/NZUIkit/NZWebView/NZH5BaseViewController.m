//
//  NZH5BaseViewController.m
//  BWW
//
//  Created by ai966669 on 2016/12/7.
//  Copyright © 2016年 ai966669. All rights reserved.
//

#import "NZH5BaseViewController.h"
#import "WDWebViewProgressViewController.h"
#import "UIColor+NZHelp.h"
#import "NZWebErrorView.h"
#import "AFNetworking.h"

@interface NZH5BaseViewController () <NZWebErrorViewDelegate> {
    
}
@property (nonatomic, strong) WDWebViewProgressViewController *progressViewController;
@property (nonatomic, strong) NZWebErrorView *viewErrInNet;

@end

@implementation NZH5BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    CGRect webViewFrame =  self.view.frame;
    _webView = [[UIWebView alloc] initWithFrame:webViewFrame];
    _webView.delegate = self;
    _webView.opaque = NO;
    _webView.backgroundColor = self.view.backgroundColor;
    UIView *webBrowserView = _webView.subviews.firstObject.subviews.firstObject;
    [webBrowserView addSubview:self.progressViewController.view];
    [self.view addSubview:_webView];
    [self tryLoadWeb];
    // Do any additional setup after loading the view.
}

- (WDWebViewProgressViewController *)progressViewController {
    if (!_progressViewController) {
        CGRect progressRect = CGRectMake(0,
                                         0,
                                         self.view.frame.size.width,
                                         2.5);
        _progressViewController = [[WDWebViewProgressViewController alloc] init];
        _progressViewController.view.frame = progressRect;
    }
    return _progressViewController;
}

- (instancetype)initWithURLString:(NSString *)urlString {
    if (self = [super init]) {
        _urlString = urlString;
    }
    return self;
}

- (void)tryLoadWeb {
    AFNetworkReachabilityStatus status = [[AFNetworkReachabilityManager sharedManager] networkReachabilityStatus];
    if (status == AFNetworkReachabilityStatusNotReachable) {
        [self.view addSubview:self.viewErrInNet];
        NSLog(@"无网络");
        if (_webView != nil) {
            _webView.hidden = true;
        }
    } else {
        _webView.hidden = false;
        [self.viewErrInNet removeFromSuperview];
        NSMutableURLRequest *request=[[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:_urlString]];
        [_webView loadRequest:request];
        
        [request addValue:@"1" forHTTPHeaderField:@"be-app"];
        [self configRequest:request];
        [_progressViewController startProgress];
        [self.view bringSubviewToFront:_progressViewController.view];
    }
}

- (void)configRequest:(NSMutableURLRequest *)request {
    
}

- (UIView *)viewErrInNet {
    if (!_viewErrInNet) {
        _viewErrInNet = [[NZWebErrorView alloc] initWithFrame:self.view.frame];
        _viewErrInNet.reloadDelegate = self;
    }
    return _viewErrInNet;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    [_progressViewController makeProgress];
    //    [self setCookieWithHost:[request.URL host]];
    //    if ([self netStatus]) {
    //        NSString *lowcaseUrl = [[request.URL absoluteString] lowercaseString];
    //        if ([lowcaseUrl hasPrefix:@"https://"] || [lowcaseUrl hasPrefix:@"http://"] || [lowcaseUrl isEqualToString:@"about:blank"]) {
    //            if([lowcaseUrl isEqualToString:@"about:blank"]) {
    //                return NO;
    //            } else {
    //                //像审批等内部页面的页面跳转不会触发webViewDidFinishLoad,所有页面在第一次加载的时候已经完成，之后跳转只会走startLoad, 故必须在startLoad的时候触发更新title
    //                _urlStringNow = [request.URL absoluteString];
    //                [NSTimer scheduledTimerWithTimeInterval:0.5
    //                                                 target:self
    //                                               selector:@selector(setWebViewTitleView)
    //                                               userInfo:nil
    //                                                repeats:NO];
    //                return  YES;
    //            }
    //        }
    //        return ![WDCmdProcessCenter dealWithCmdAndOpenWhenNeed:[request.URL absoluteString] sender:self orgId:nil];
    //    } else {
    //        return NO;
    //    }
    return  YES;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [_progressViewController finishProgress];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [_progressViewController finishProgress];
}

#pragma --mark NZWebErrorViewDelegate

- (void)reload {
    [self tryLoadWeb];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
