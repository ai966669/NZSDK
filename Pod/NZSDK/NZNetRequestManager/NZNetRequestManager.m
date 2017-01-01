//
//  NZNetRequestManager.m
//  BWW
//
//  Created by ai966669 on 2016/12/22.
//  Copyright © 2016年 ai966669. All rights reserved.
//

#import "NZNetRequestManager.h"
#import "AFNetworking.h"

@implementation NZNetRequestManager

SHARED_SINGLETON_FOR_CLASS(NZNetRequestManager)

- (NSURLSessionDataTask *)universalRequestWithRequestMethod:(RequestMethod)requestMethod urlString:(NSString *)urlString params:(NSDictionary *)params successBlock:(SuccessSessionBlock)successBlock failBlock:(FailSessionBlock)failBlock {
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    switch (requestMethod) {
        case RequestMethodGet:
            return  [session GET:urlString parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSLog(@"成功");
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSLog(@"失败");
            }];
        case RequestMethodPost:
            return  [session POST:urlString parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                NSLog(@"成功");
                successBlock(task,responseObject);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                failBlock(task,error);
                NSLog(@"失败");
            }];
    }
}

- (NSString *)baseURL {
    return @"www.baidu.com";
}

@end
