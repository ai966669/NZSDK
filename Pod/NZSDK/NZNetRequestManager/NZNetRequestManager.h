//
//  NZNetRequestManager.h
//  BWW
//
//  Created by ai966669 on 2016/12/22.
//  Copyright © 2016年 ai966669. All rights reserved.
//

#import <Foundation/Foundation.h>

//typedef void (^SuccessSessionBlock)(int code);
//typedef void (^FailSessionBlock)(int code);

typedef void (^SuccessSessionBlock)(NSURLSessionDataTask *  task, id  responseObject);
typedef void (^FailSessionBlock)(NSURLSessionDataTask *  task, NSError *  error);

@interface NZNetRequestManager : NSObject

typedef NS_ENUM(NSUInteger, RequestMethod) {
    RequestMethodPost,
    RequestMethodGet,
};

+ (instancetype) sharedInstance;

- (NSURLSessionDataTask *)universalRequestWithRequestMethod:(RequestMethod)requestMethod urlString:(NSString *)urlString params:(NSDictionary *)params successBlock:(SuccessSessionBlock )successBlock failBlock:(FailSessionBlock )failBlock;

- (NSString *)baseURL;

@end
