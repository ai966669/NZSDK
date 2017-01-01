//
//  NZZCheckingOfInput.h
//  LbNSPredicate
//
//  Created by ai966669 on 15/6/26.
//  Copyright (c) 2015年 ai966669. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NZInputCheck : NSObject

+ (instancetype) sharedInstance;

- (BOOL)checkNickName:(NSString *)nickName showHUD:(BOOL)showHUD;

- (BOOL)checkMobileNumber:(NSString *)mobileNumber showHUD:(BOOL)showHUD;

- (BOOL)checkPassword:(NSString *)password showHUD:(BOOL)showHUD;

- (BOOL)checkEmail:(NSString *)email showHUD:(BOOL)showHUD;

- (BOOL)checkNotNilOrNoValue:(NSString *)string showHUD:(BOOL)showHUD textToShow:(NSString *)text;

//由于评论正则判断背景颜色要求和别的不一样，所以单独对提示框在checkComment中进行配置

//- (BOOL)checkComment:(NSString *)comment showGrayHUD:(BOOL)showHUD textToShow:(NSString *)text;

- (BOOL)checkReasonOfRefound:(NSString *)reason showHUD:(BOOL)showHUD textToShow:(NSString *)text;

- (BOOL)checkIsUsefulContent:(NSString *)content showHUD:(BOOL)showHUD;

- (BOOL)checkIdentifyingCode:(NSString *)code showHUD:(BOOL)showHUD;

- (BOOL)isVAlidateQQ:(NSString *)qq;

- (BOOL)validateNumber:(NSString*)number;


@end
