//
//  QZTabbar.m
//  QQZone
//
//  Created by BJT on 17/6/12.
//  Copyright © 2017年 BJT. All rights reserved.
//

#import "QZTabbar.h"
#import "QZTabbarButton.h"

@interface QZTabbar ()

/**
 *  当前选中的 tabbar 按钮
 */
@property (nonatomic,weak) QZTabbarButton *currentSelectedBtn;

@end

@implementation QZTabbar

-(instancetype)init
{
    self = [super init];
    if (self) {
        
        // 默认选中第一个按钮
        QZTabbarButton *firstBtn = [self setupButton:@"tab_bar_feed_icon" title:@"全部动态"];
        firstBtn.enabled = NO;
        self.currentSelectedBtn = firstBtn;
        
        [self setupButton:@"tab_bar_passive_feed_icon" title:@"与我相关"];
        [self setupButton:@"tab_bar_pic_wall_icon" title:@"照片墙"];
        [self setupButton:@"tab_bar_e_album_icon" title:@"电子相册"];
        [self setupButton:@"tab_bar_friend_icon" title:@"好友"];
        [self setupButton:@"tab_bar_e_more_icon" title:@"更多"];
        
    }
    return self;
}

-(QZTabbarButton *)setupButton:(NSString *)img title:(NSString *)title
{
    QZTabbarButton *btn = [[QZTabbarButton alloc] init];
    [btn setImage:[UIImage imageNamed:img] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    [self addSubview:btn];

    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    
    return btn;
}

-(void)btnClick:(QZTabbarButton *)btn
{
    self.currentSelectedBtn.enabled = YES;
    self.currentSelectedBtn = btn;
    btn.enabled = NO;
    
    // 发出选中按钮的通知
    [QZNotificationCenter postNotificationName:QZTabbarDidSelectNotification object:nil userInfo:@{QZTabbarDidSelectButtonIndex:@(btn.tag)}];
    
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    NSInteger count = self.subviews.count;
    
    for (int i = 0 ; i < count; i++) {
        QZTabbarButton *btn = self.subviews[i];
        btn.height = self.height / count;
        btn.width = self.width;
        btn.x = 0;
        btn.y = i * btn.height;
        btn.tag = i;
    }
    

    
}

@end
