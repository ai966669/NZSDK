//
//  NZWebErrorView.h
//  BWW
//
//  Created by ai966669 on 2016/12/7.
//  Copyright © 2016年 ai966669. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NZWebErrorViewDelegate <NSObject>

- (void)reload;

@end

@interface NZWebErrorView : UIView

@property (weak,nonatomic) id <NZWebErrorViewDelegate> reloadDelegate;

@end
