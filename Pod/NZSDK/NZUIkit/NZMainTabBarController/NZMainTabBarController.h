//
//  NZQuickTabBarController.h
//  NZZUiKit
//
//  Created by ai966669 on 2016/12/6.
//  Copyright © 2016年 ai966669. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NZMainTabBarController : UITabBarController

- (instancetype)initWithControllerNames:(NSArray <NSString*>*)controllerNames tabItemTitles:(NSArray <NSString*>*)tabItemTitles tabItemNormalImages:(NSArray <UIImage *>*)tabItemNormalImages tabItemSelectedImages:(NSArray <UIImage *>*)tabItemSelectedImages;

- (void)setTabBarItemTitleColorWithSelectedColor:(UIColor *)selectedColor normalColor:(UIColor *)normalColor;

- (void)setTabbarBackGroundWithColor:(UIColor *)tabbarBackGroundColor;

@end
