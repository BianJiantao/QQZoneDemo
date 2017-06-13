//
//  QZHomeViewController.m
//  QQZone
//
//  Created by BJT on 17/6/12.
//  Copyright © 2017年 BJT. All rights reserved.
//

#import "Masonry.h"

#import "QZHomeViewController.h"
#import "QZDock.h"


@interface QZHomeViewController ()

@property (nonatomic,weak) QZDock *dock;
/**
 *  当前正在显示的子控制器
 */
@property (nonatomic,weak) UIViewController *currentShowingVc;

@end

@implementation QZHomeViewController

- (QZDock *)dock
{
    if (_dock == nil) {
        
        QZDock *dock = [[QZDock alloc] init];
        [self.view addSubview:dock];
        _dock = dock;
    }
    return _dock;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = kColor(55, 55, 55);
    
    // 初始化子控制器
    [self setupChildVCs];
    
    [QZNotificationCenter addObserver:self selector:@selector(tabbarDidClick:) name:QZTabbarDidSelectNotification object:nil];
    
    [self willRotateToInterfaceOrientation:self.interfaceOrientation duration:0];
}

-(void)setupChildVCs
{
    for (int i = 0; i < 6; i++) {
        
        UIViewController *vc = [[UIViewController alloc] init];
        vc.view.backgroundColor = kRandomColor;
        [self addChildViewController:vc];
    }
    // 默认显示第一个子控制器
    [self switchChildVc:0];
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

#pragma mark - tabbar 选项卡按钮点击的监听方法
-(void)tabbarDidClick:(NSNotification *)noti
{
//    NSLog(@"%d",[noti.userInfo[QZTabbarDidSelectButtonIndex] integerValue]);
    int index = [noti.userInfo[QZTabbarDidSelectButtonIndex] integerValue];
    
    [self switchChildVc:index];
}

-(void)switchChildVc:(NSInteger)index
{
    [self.currentShowingVc.view removeFromSuperview];
    
    UIViewController *vc = self.childViewControllers[index];
    self.currentShowingVc = vc;
    [self.view addSubview:vc.view];
    
    [vc.view mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.top.equalTo(self.view.mas_top);
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.equalTo(self.dock.mas_right);
        make.right.equalTo(self.view.mas_right);
        
    }];
    
    
}


@end
