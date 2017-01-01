//
//  NZZCheckingOfInput.m
//  LbNSPredicate
//
//  Created by ai966669 on 15/6/26.
//  Copyright (c) 2015年 ai966669. All rights reserved.
//

#import "NZInputCheck.h"
#import <SVProgressHUD/SVProgressHUD.h>

@implementation NZInputCheck

SHARED_SINGLETON_FOR_CLASS(NZInputCheck)
//nzzdohere 为什么单例不注释就会出现问题
//static  NZInputCheck *shareObjc=nil;
//+ (instancetype) sharedInstance
//{
//    static  NZInputCheck *inst = nil;
//    if (inst == nil) {
//        static dispatch_once_t onceToken;
//        dispatch_once(&onceToken, ^{
//            inst = [[ NZInputCheck alloc] init];
//        });
//    }
//    return inst;
//}

- (BOOL)checkComment:(NSString *)comment showGrayHUD:(BOOL)showHUD textToShow:(NSString *)text{
    [SVProgressHUD showErrorWithStatus:@"这个方法没实现为什么还有呢"];
    return false;
}

typedef NS_ENUM(NSInteger, typeOfHub) {
    typeOfHubInfor          = 1,
    typeOfHubError          = 2,
};

//    全角标点\u3000-\u301e\ufe10-\ufe19\ufe30-\ufe44\ufe50-\ufe6b\uff01-\uffee 中文\u4e00-\u9fa5
- (BOOL)checkNickName:(NSString *)nickName showHUD:(BOOL)showHUD{
    if ([self checkNotNilOrNoValue:nickName showHUD:YES textToShow:@"昵称不能为空"]) {
        NSString * regex        = @"(^[A-Za-z0-9\u4e00-\u9fa5]+)";
        NSPredicate * pred      = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        if(![pred evaluateWithObject:nickName]){
            [self showOrNot:@"昵称不能含有特殊字符" showHUD:showHUD typeOfHub:typeOfHubError];
            return NO;
        }else if([nickName length]>8){
            [self showOrNot:@"昵称长度不能大于八位" showHUD:showHUD typeOfHub:typeOfHubError];
            return  NO;
        }else{
            return YES;
        }
    }else{
        return NO;
    }
}

- (BOOL)checkPassword:(NSString *)password showHUD:(BOOL)showHUD{
    if ([self checkNotNilOrNoValue:password showHUD:YES textToShow:@"请输入密码"]) {
        NSString * regex        = @"(^[A-Za-z0-9\u3000-\u301e\ufe10-\ufe19\ufe30-\ufe44\ufe50-\ufe6b\uff01-\uffee]+)";
        NSPredicate * pred      = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        if(![pred evaluateWithObject:password]){
            [self showOrNot:@"密码不能包含特殊符号" showHUD:showHUD typeOfHub:typeOfHubError];
            return NO;
        }
        else if([password length]>12){
            [self showOrNot:@"密码长度大于于十二位" showHUD:showHUD typeOfHub:typeOfHubError];
            return  NO;
        }else if([password length]<6) {
            [self showOrNot:@"密码长度小于六位" showHUD:showHUD typeOfHub:typeOfHubError];
            return  NO;
        }else{
            return YES;
        }
    }else{
        return NO;
    }
}
- (BOOL)checkMobileNumber:(NSString *)mobileNumber showHUD:(BOOL)showHUD{
        if ([self checkNotNilOrNoValue:mobileNumber showHUD:showHUD textToShow:@"号码不能为空"]) {
            if ([self isMobileNumber:mobileNumber]) {
                return YES;
            }else{
                [self showOrNot:@"号码格式不正确" showHUD:showHUD typeOfHub:typeOfHubError];
                return NO;
            }
        }else{
            return NO;
        }
}

- (BOOL)checkEmail:(NSString *)email showHUD:(BOOL)showHUD{
    if ([self checkNotNilOrNoValue:email showHUD:showHUD textToShow:@"邮箱不能为空"]) {
        if ([self isEmail:email]){
            return YES;
        }else{
            [self showOrNot:@"邮箱格式不正确" showHUD:showHUD typeOfHub:typeOfHubError];
            return NO;
        }
    }else{
        return NO;
    }
}
- (BOOL)checkReasonOfRefound:(NSString *)reason showHUD:(BOOL)showHUD textToShow:(NSString *)text{
    if ([self checkNotNilOrNoValue:reason showHUD:showHUD textToShow:@"退款原因不能为空"]) {
        NSString * regex= @"(^[A-Za-z0-9\u3000-\u301e\ufe10-\ufe19\ufe30-\ufe44\ufe50-\ufe6b\uff01-\uffee\u4e00-\u9fa5\\r\\n]+)";
        NSPredicate * pred      = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        if(![pred evaluateWithObject:reason]){
            [self showOrNot:@"退款原因不能有特殊字符" showHUD:showHUD typeOfHub:typeOfHubError];
            [self returnDefaultStyle];
            return NO;
        }
        else if(![self checkIsUsefulContent:reason showHUD:true ]){
            return NO;
        }else{
            return YES;
        }
    }else{
        [self returnDefaultStyle];
        return NO;
    }
}
- (BOOL)checkIdentifyingCode:(NSString *)code showHUD:(BOOL)showHUD{
    NSString *identifyingCodeReg=@"^[0-9]{6}";
    if ([self checkNotNilOrNoValue:code showHUD:showHUD textToShow:@"验证码不能为空"]) {
        NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", identifyingCodeReg];
        if ([regextestmobile evaluateWithObject:code] == YES){
            return YES;
        }else{
            return NO;
        }
    }else{
        return NO;
    }
    
}
- (BOOL)checkIsUsefulContent:(NSString *)content showHUD:(BOOL)showHUD{
    NSString * regex=@"(^[\u3000-\u3000\u3001-\u301e\ufe10-\ufe19\ufe30-\ufe30\ufe31-\ufe44\ufe50-\ufe6b\uff01-\uff0f])+";
    NSPredicate * pred= [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    int nubOfPunctuate=0;
    for(int i=0;i<content.length;i++){
        NSString *one=[content substringWithRange:NSMakeRange(i, 1)];
        //        NSLog(@"第%d个%@",i,one);
        if([pred evaluateWithObject:one]){
            //            NSLog(@"第%d个%@是的------",i,one);
            nubOfPunctuate++;
        }
    }
    if (nubOfPunctuate<0.5*content.length) {
        return YES;
    }else{
        [self showOrNot:@"无用的字符过多" showHUD:showHUD typeOfHub:typeOfHubInfor];
        return NO;
    }
}
- (void)returnDefaultStyle{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if(!SVProgressHUD.isVisible){
            [SVProgressHUD setForegroundColor:[UIColor blackColor]];
            [SVProgressHUD setBackgroundColor:[UIColor whiteColor]];
        }
    });
}
- (BOOL)checkNotNilOrNoValue:(NSString *)string showHUD:(BOOL)showHUD textToShow:(NSString *)text{
    if (string.length!=0&&string!=nil) {
        return YES;
    }else{
        [self showOrNot:text showHUD:showHUD typeOfHub:typeOfHubInfor];
        return NO;
    }
}
- (void)showOrNot:(NSString *)text showHUD:(BOOL)showHUD typeOfHub:(typeOfHub) type{
    if (showHUD){
        switch (type) {
            case typeOfHubInfor:
                [SVProgressHUD showInfoWithStatus:text];
                break;
            case typeOfHubError:
                [SVProgressHUD showErrorWithStatus:text];
                break;
            default:
                break;
        }
    }
}
// 正则判断手机号码地址格式
- (BOOL)isMobileNumber:(NSString *)mobileNum
{
    
    NSString *telReg=@"^(0|86|17951)?1[3|4|5|7|8][0-9]{9}";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", telReg];
    if ([regextestmobile evaluateWithObject:mobileNum] == YES){
        return YES;
    }else{
        return NO;
    }
}
//邮箱
- (BOOL)isEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

- (BOOL)isVAlidateQQ:(NSString *)qq
{
    NSString *qqRegex = @"[1-9][0-9]{4,10}";
    NSPredicate *qqTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",qqRegex];
    return [qqTest evaluateWithObject:qq];  //谓词查询语句
}

//数字
- (BOOL)validateNumber:(NSString*)number {
    BOOL res = YES;
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    int i = 0;
    while (i < number.length) {
        NSString * string = [number substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        i++;
    }
    return res;
}


@end
