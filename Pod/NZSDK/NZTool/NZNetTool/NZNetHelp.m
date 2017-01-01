//
//  NZNetHelp.m
//  BWW
//
//  Created by ai966669 on 2016/12/30.
//  Copyright © 2016年 ai966669. All rights reserved.
//

#import "NZNetHelp.h"
#import "NSString+NZNet.h"

@implementation NZNetHelp

SHARED_SINGLETON_FOR_CLASS(NZNetHelp)

- (void)setDefaultPathNSHTTPCookieStorage:(NSString *)cookieValue cookieName:(NSString *)cookieName host:(NSString *)host {
    NSMutableDictionary *cookieProperties = [NSMutableDictionary dictionary];
    [cookieProperties setValue:[host shortHostForSetCookie] forKey:NSHTTPCookieDomain];
    [cookieProperties setValue:@"/" forKey:NSHTTPCookiePath];
    [cookieProperties setObject:cookieValue forKey:NSHTTPCookieValue];
    [cookieProperties setObject:cookieName forKey:NSHTTPCookieName];
    NSHTTPCookie *cookie4 = [[NSHTTPCookie alloc] initWithProperties:cookieProperties];
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie4];
}

@end
