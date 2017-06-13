

/**
 *  dock 竖屏时宽度
 */
extern const CGFloat QZDockPW;
/**
 *  dock 横屏时宽度
 */
extern const CGFloat QZDockLW;

/**
 *  屏幕横屏宽度 (1024)
 */
extern const CGFloat QZScreenLW;
/**
 *  屏幕竖屏宽度 (768)
 */
extern const CGFloat QZScreenPW;

#define LandScape  ([UIScreen mainScreen].bounds.size.width == QZScreenLW)
#define Portrait  ([UIScreen mainScreen].bounds.size.width == QZScreenPW)


#define kColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define kRandomColor kColor(arc4random_uniform(255),arc4random_uniform(255),arc4random_uniform(255))

#define QZNotificationCenter  [NSNotificationCenter defaultCenter] 
extern NSString *const QZTabbarDidSelectNotification;

extern NSString *const QZTabbarDidSelectButtonIndex;