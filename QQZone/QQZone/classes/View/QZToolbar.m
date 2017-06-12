//
//  QZToolbar.m
//  QQZone
//
//  Created by BJT on 17/6/12.
//  Copyright © 2017年 BJT. All rights reserved.
//

#import "QZToolbar.h"

@implementation QZToolbar

-(instancetype)init
{
    self = [super init];
    if (self) {
        
        [self setupButton:@"tabbar_photo"];
        [self setupButton:@"tabbar_mood"];
        [self setupButton:@"tabbar_blog"];
        
    }
    return self;
}


-(void)setupButton:(NSString *)img
{
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:img] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"]  forState:UIControlStateHighlighted];
    [self addSubview:btn];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    NSInteger count = self.subviews.count;
    if (LandScape) { // 横屏
        
        for (int i = 0 ; i < count; i++) {
            UIButton *btn = self.subviews[i];
            btn.height = self.height;
            btn.width = btn.height;
            btn.x = i * btn.width;
            btn.y = 0;
            
        }
        
    }else{ // 竖屏
        
        for (int i = 0 ; i < count; i++) {
            UIButton *btn = self.subviews[i];
            btn.width = self.width;
            btn.height = btn.width;
            btn.x = 0;
            btn.y = i * btn.height;
            
        }
        
    }
    
}


@end
