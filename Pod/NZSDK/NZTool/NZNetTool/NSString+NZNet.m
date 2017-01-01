//
//  NSString+NZNet.m
//  BWW
//
//  Created by ai966669 on 2016/12/30.
//  Copyright © 2016年 ai966669. All rights reserved.
//

#import "NSString+NZNet.h"

@implementation NSString (NZNet)

- (NSString *)shortHostForSetCookie {
    if (self.length == 0) {
        return nil;
    }
    NSArray * seperateDotArray = [self componentsSeparatedByString:@"."];
    NSInteger level = [seperateDotArray count];
    if (level > 2) {
        NSString *end1 = [seperateDotArray objectAtIndex:(level-1)];
        NSString *end2 = [seperateDotArray objectAtIndex:(level-2)];
        NSCharacterSet *numericOnly = [NSCharacterSet decimalDigitCharacterSet];
        NSCharacterSet *endString = [NSCharacterSet characterSetWithCharactersInString:end1];
        if ([numericOnly isSupersetOfSet:endString]) {
            //如果是IP则直接返回IP
            return self;
        } else if ([end1 isEqualToString:@"cn"] && [end2 isEqualToString:@"com"]) {
            NSString *domain = [seperateDotArray objectAtIndex:(level-3)];
            return [NSString stringWithFormat:@".%@.com.cn", domain];
        } else {
            return [NSString stringWithFormat:@".%@.%@", end2, end1];
        }
    }
    
    return self;
}


@end
