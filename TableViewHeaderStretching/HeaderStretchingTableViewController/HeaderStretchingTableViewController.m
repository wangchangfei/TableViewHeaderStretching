//
//  HeaderStretchingTableViewController.m
//  TableViewHeaderStretching
//
//  Created by wangchangfei on 15/9/23.
//  Copyright © 2015年 wangchangfei. All rights reserved.
//

#import "HeaderStretchingTableViewController.h"


//头部被拉伸图片控件的默认高度
CGFloat CFTopViewH = 200;

@interface HeaderStretchingTableViewController ()

/** 顶部拉伸的图片 */
@property (nonatomic, weak) UIImageView *topView;

/** 导航栏背景图片 */
@property (nonatomic, strong) UIImage *navigation_background_image;


@end

@implementation HeaderStretchingTableViewController

-(UIImage *)navigation_background_image{
    if(!_navigation_background_image){
        if(self.navigation_backgroundImageName){
           _navigation_background_image = [UIImage imageNamed:self.navigation_backgroundImageName];
        }
    }
    return _navigation_background_image;
}

-(void)setStretchingImageHeight:(CGFloat)stretchingImageHeight{
    _stretchingImageHeight = stretchingImageHeight;
    CFTopViewH = stretchingImageHeight;
    self.tableView.contentInset = UIEdgeInsetsMake(stretchingImageHeight , 0, 0, 0);
    self.topView.frame = CGRectMake(0, -CFTopViewH, self.tableView.frame.size.width, CFTopViewH);
}

- (void)setStretchingImageName:(NSString *)stretchingImageName{
     _stretchingImageName = stretchingImageName;
    self.topView.image = [UIImage imageNamed:stretchingImageName];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置内边距(让cell往下移动一段距离)
    self.tableView.contentInset = UIEdgeInsetsMake(CFTopViewH , 0, 0, 0);
    self.automaticallyAdjustsScrollViewInsets=NO;
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    UIImageView *topView = [[UIImageView alloc] init];
    topView.frame = CGRectMake(0, -CFTopViewH, self.tableView.frame.size.width, CFTopViewH);
    [self.tableView addSubview:topView];
    self.topView = topView;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat yOffset  = scrollView.contentOffset.y;
    CGFloat xOffset = (yOffset + CFTopViewH) / 2;
    
    if (yOffset < -CFTopViewH) {
        CGRect rect = self.topView.frame;
        rect.origin.y = yOffset;
        rect.size.height =  -yOffset ;
        rect.origin.x = xOffset;
        rect.size.width = scrollView.frame.size.width + fabs(xOffset) * 2;
        
        self.topView.frame = rect;
    }
    
    CGFloat alpha = (yOffset + CFTopViewH) / CFTopViewH;
    if(self.edgesForExtendedLayout == UIRectEdgeTop || self.edgesForExtendedLayout == UIRectEdgeAll){
        [self.navigationController.navigationBar setBackgroundImage:[self imageByApplyingAlpha:alpha image:self.navigation_background_image == nil?[self imageWithColor:[UIColor orangeColor]]:self.navigation_background_image] forBarMetrics:UIBarMetricsDefault];
    }
}

//设置图片透明度
- (UIImage *)imageByApplyingAlpha:(CGFloat)alpha  image:(UIImage*)image {
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0f);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect area = CGRectMake(0, 0, image.size.width, image.size.height);
    
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -area.size.height);
    
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    
    CGContextSetAlpha(ctx, alpha);
    
    CGContextDrawImage(ctx, area, image.CGImage);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (UIImage *)imageWithColor:(UIColor *)color {
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return theImage;
}
@end
