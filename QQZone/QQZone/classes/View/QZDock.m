//
//  QZDock.m
//  QQZone
//
//  Created by BJT on 17/6/12.
//  Copyright © 2017年 BJT. All rights reserved.
//

#import "QZDock.h"
#import "QZIconView.h"
#import "QZTabbar.h"
#import "QZToolbar.h"

@interface QZDock ()

@property (nonatomic,weak) QZIconView *iconView;
@property (nonatomic,weak) QZTabbar *tabbar;
@property (nonatomic,weak) QZToolbar *toolbar;

@end


@implementation QZDock

-(instancetype)init{
    self = [super init];
    if (self) {
        
        // 创建 iconView
        QZIconView *iconView = [[QZIconView alloc] init];
        [self addSubview:iconView];
        self.iconView = iconView;
//        iconView.backgroundColor = kRandomColor;
        
        // 创建 tabbar
        QZTabbar *tabbar = [[QZTabbar alloc] init];
        [self addSubview:tabbar];
        self.tabbar = tabbar;
//        tabbar.backgroundColor = kRandomColor;
        
        // 创建toolbar
        QZToolbar *toolbar = [[QZToolbar alloc] init];
        [self addSubview:toolbar];
        self.toolbar = toolbar;
//        toolbar.backgroundColor = kRandomColor;
        
    }
    return self;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.toolbar.width = self.width;
    self.tabbar.width = self.width;
    self.tabbar.height = self.tabbar.subviews.count * QZDockPW;
    
    if (LandScape) { // 横屏
        
        self.toolbar.height = self.width / self.toolbar.subviews.count;
        
        self.iconView.y = 70;
        self.iconView.width = self.width * 0.4;
        self.iconView.height = self.iconView.width + 30;
        self.iconView.x = (self.width - self.iconView.width) * 0.5;
        
    }else{ // 竖屏
        
        self.toolbar.height = self.width * 3;
        
        self.iconView.y = 50;
        self.iconView.x = 5;
        self.iconView.width = self.width - 2 * self.iconView.x;
        self.iconView.height = self.iconView.width;
    }
    
    self.toolbar.x = 0;
    self.toolbar.y = self.height - self.toolbar.height;
    
    self.tabbar.x = 0;
    self.tabbar.y = self.toolbar.y - self.tabbar.height;
    
}


@end
