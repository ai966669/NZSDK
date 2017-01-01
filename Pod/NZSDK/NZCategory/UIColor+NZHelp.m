//
//  UIColor+NZHelp.m
//  
//
//  Created by ai966669 on 2016/12/7.
//
//

#import "UIColor+NZHelp.h"

@implementation UIColor (NZHelp)

+ (UIColor *)colorWithHex:(unsigned int)rgbValue {
    return [UIColor colorWithRed:(CGFloat) (((rgbValue & 0xFF0000) >> 16) / 255.0) green:(CGFloat) (((rgbValue & 0xFF00) >> 8) / 255.0) blue:(CGFloat) ((rgbValue & 0xFF) / 255.0) alpha:1.0];
}


@end
