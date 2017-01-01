//
//  NZQuickTabBarController.m
//  NZZUiKit
//
//  Created by ai966669 on 2016/12/6.
//  Copyright © 2016年 ai966669. All rights reserved.
//

#import "NZMainTabBarController.h"

@interface NZMainTabBarController () {
    NSArray <NSString*>* _controllerNames;
    NSArray <NSString*>* _tabItemTitles;
    NSArray <UIImage *>* _tabItemNormalImages;
    NSArray <UIImage *>* _tabItemSelectedImages;
}

@end

@implementation NZMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewControllers = [self p_configureTabControllersWithControllerNames:_controllerNames tabItemTitles:_tabItemTitles tabItemNormalImages:_tabItemNormalImages tabItemSelectedImages:_tabItemSelectedImages];
    // Do any additional setup after loading the view.
}


- (NSArray *)p_configureTabControllersWithControllerNames:(NSArray *)controllerNames tabItemTitles:(NSArray *)tabItemTitles tabItemNormalImages:(NSArray *)tabItemNormalImages tabItemSelectedImages:(NSArray *)tabItemSelectedImages {
    NSMutableArray *tabControllers = [[NSMutableArray alloc] init];
    [controllerNames enumerateObjectsUsingBlock:^(NSString *controllerName, NSUInteger idx, BOOL *stop) {
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:(UIViewController *) [[NSClassFromString(controllerName) alloc] init]];
        nav.tabBarItem = [[UITabBarItem alloc] initWithTitle:tabItemTitles[idx] image:[tabItemNormalImages[idx] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[tabItemSelectedImages[idx] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [tabControllers addObject:nav];
    }];
    return tabControllers.copy;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (instancetype)initWithControllerNames:(NSArray <NSString*>*)controllerNames tabItemTitles:(NSArray <NSString*>*)tabItemTitles tabItemNormalImages:(NSArray <UIImage *>*)tabItemNormalImages tabItemSelectedImages:(NSArray <UIImage *>*)tabItemSelectedImages {
    _controllerNames = controllerNames;
    _tabItemTitles = tabItemTitles;
    _tabItemNormalImages = tabItemNormalImages;
    _tabItemSelectedImages = tabItemSelectedImages;
    self = [super init];
    if (self) {
        _controllerNames = controllerNames;
        _tabItemTitles = tabItemTitles;
        _tabItemNormalImages = tabItemNormalImages;
        _tabItemSelectedImages = tabItemSelectedImages;
    }
    return self;
}

- (void)setTabBarItemTitleColorWithSelectedColor:(UIColor *)selectedColor normalColor:(UIColor *)normalColor {
    [self.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : selectedColor} forState:UIControlStateSelected];
    self.tabBar.tintColor = normalColor;
}

- (void)setTabbarBackGroundWithColor:(UIColor *)tabbarBackGroundColor {
    UIView *tabbarBackgroundView = [[UIView alloc] initWithFrame:self.tabBar.bounds];
    tabbarBackgroundView.backgroundColor = tabbarBackGroundColor;
    [self.tabBar insertSubview:tabbarBackgroundView atIndex:0];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
