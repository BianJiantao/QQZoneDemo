//
//  QZIconView.m
//  QQZone
//
//  Created by BJT on 17/6/12.
//  Copyright © 2017年 BJT. All rights reserved.
//

#import "QZIconView.h"

@implementation QZIconView

-(instancetype)init{
    self = [super init];
    if (self) {
        
        [self setImage:[UIImage imageNamed:@"lufy"] forState:UIControlStateNormal];
        [self setTitle:@"Apple" forState:UIControlStateNormal];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.imageView.layer.cornerRadius = 10;
        
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    if (LandScape) { // 横屏
        
        self.imageView.width = self.width;
        self.imageView.height = self.imageView.width;
        self.imageView.x = 0;
        self.imageView.y = 0;
        
        self.titleLabel.hidden = NO;
        self.titleLabel.x = 0;
        self.titleLabel.y = self.imageView.height;
        self.titleLabel.width = self.width;
        self.titleLabel.height = self.height - self.imageView.height;
        
    }else{  // 竖屏
        
        self.titleLabel.hidden = YES;
        self.imageView.frame = self.bounds;
        
    }
    
}

@end
