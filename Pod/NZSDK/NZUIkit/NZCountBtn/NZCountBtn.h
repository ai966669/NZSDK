//
//  NZCountBtn.h
//  NZZUiKit
//
//  Created by ai966669 on 2016/12/20.
//  Copyright © 2016年 ai966669. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NZCountBtn : UIButton

@property (nonatomic,assign) int count;
@property (nonatomic,strong) NSString *title;

- (void)startCount;

@end
