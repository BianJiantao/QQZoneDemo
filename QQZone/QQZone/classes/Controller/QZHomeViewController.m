//
//  QZHomeViewController.m
//  QQZone
//
//  Created by BJT on 17/6/12.
//  Copyright © 2017年 BJT. All rights reserved.
//

#import "QZHomeViewController.h"
#import "QZDock.h"



const

@interface QZHomeViewController ()

@property (nonatomic,weak) QZDock *dock;

@end

@implementation QZHomeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = kColor(55, 55, 55);
    
    QZDock *dock = [[QZDock alloc] init];
    [self.view addSubview:dock];
    self.dock = dock;
//    dock.backgroundColor = [UIColor greenColor];
    
    [self willRotateToInterfaceOrientation:self.interfaceOrientation duration:0];
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation)) { // 将要横屏
        
        self.dock.width = QZDockLW ;
        self.dock.height = QZScreenPW;
        
    }else{  // 将要竖屏
        
        self.dock.width = QZDockPW ;
        self.dock.height = QZScreenLW;
        
    }
    
    
}

@end
