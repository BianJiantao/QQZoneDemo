//
//  QZTabbarButton.m
//  QQZone
//
//  Created by BJT on 17/6/12.
//  Copyright © 2017年 BJT. All rights reserved.
//

#import "QZTabbarButton.h"

@implementation QZTabbarButton

-(instancetype)init
{
    self = [super init];
    if (self) {
        
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateDisabled];
        self.imageView.contentMode = UIViewContentModeCenter ;
//        self.imageView.backgroundColor = [UIColor redColor];
//        self.titleLabel.backgroundColor = [UIColor greenColor];
        self.adjustsImageWhenHighlighted = NO;
        self.adjustsImageWhenDisabled = NO;
        
    }
    return self;
}
-(void)setHighlighted:(BOOL)highlighted
{
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    if (LandScape) {  // 横屏
        
        self.imageView.height = self.height;
        self.imageView.width = self.width * 0.4;
        self.imageView.x = 0;
        self.imageView.y = 0;
        
        
        self.titleLabel.hidden = NO;
        self.titleLabel.x = self.imageView.width;
        self.titleLabel.y = 0;
        self.titleLabel.height = self.height;
        self.titleLabel.width = self.width - self.imageView.width;
        
    }else{  // 竖屏
        
        self.titleLabel.hidden = YES;
        self.imageView.frame = self.bounds;
    }
}


@end
