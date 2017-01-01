//
//  NZWebErrorView.m
//  BWW
//
//  Created by ai966669 on 2016/12/7.
//  Copyright © 2016年 ai966669. All rights reserved.
//

#import "NZWebErrorView.h"
#import "UIColor+NZHelp.h"

@implementation NZWebErrorView

- (void)layoutSubviews {
    UIImageView *imgErr = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"iconNetErr"]];
    imgErr.frame = CGRectMake((self.frame.size.width - 75) / 2,
                              60 + NZ_HEIGHT_NAV_BAR,
                              75,
                              90);
    UILabel *lblErr = [[UILabel alloc] initWithFrame:CGRectMake((self.frame.size.width - 200) / 2,
                                                                CGRectGetMaxY(imgErr.frame) + 30,
                                                                200,
                                                                90)];
    lblErr.text = @"网络不给力\n轻触屏幕重新加载";
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:lblErr.text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:9.0];//调整行间距
    [attributedString addAttribute:NSParagraphStyleAttributeName
                             value:paragraphStyle
                             range:NSMakeRange(0, [lblErr.text length])];
    lblErr.attributedText = attributedString;
    UIFont *fontLblErr = [UIFont systemFontOfSize:16];
    lblErr.numberOfLines = 0;
    lblErr.textAlignment = NSTextAlignmentCenter;
    lblErr.font = fontLblErr;
    lblErr.textColor = [UIColor colorWithHex:0x929292];
    
    UITapGestureRecognizer *reloadTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                action:@selector(reload)];
    reloadTap.numberOfTapsRequired = 1;
    reloadTap.numberOfTouchesRequired = 1;
    
    [self addGestureRecognizer:reloadTap];
    [self addSubview:lblErr];
    [self addSubview:imgErr];
}

- (void)reload {
    if (self.reloadDelegate && [self.reloadDelegate respondsToSelector:@selector(reload)] ) {
        [self.reloadDelegate reload];
    }
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
