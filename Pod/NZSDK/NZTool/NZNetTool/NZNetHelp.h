//
//  NZNetHelp.h
//  BWW
//
//  Created by ai966669 on 2016/12/30.
//  Copyright © 2016年 ai966669. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NZNetHelp : NSObject

+ (instancetype) sharedInstance;

- (void)setDefaultPathNSHTTPCookieStorage:(NSString *)cookieValue cookieName:(NSString *)cookieName host:(NSString *)host;

@end
