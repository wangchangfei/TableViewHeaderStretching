//
//  StrechDemoViewController.m
//  TableViewHeaderStretching
//
//  Created by wangchangfei on 15/9/23.
//  Copyright © 2015年 wangchangfei. All rights reserved.
//

#import "StrechDemoViewController.h"

@interface StrechDemoViewController ()
{
    UIButton *leftBtn;
    UIButton *rightBtn;
}
@end

@implementation StrechDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1、 设置导航栏的背景图片
    self.navigation_backgroundImageName = @"navigation_background";
    
    // 2、设置被拉伸图片view的高度
    self.stretchingImageHeight = 200;
    
    // 3、设置头部拉伸图片的名称
    self.stretchingImageName = @"bg";
    
    
    
    
    leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 30)];
    [leftBtn setTitle:@"left" forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    rightBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 30)];
    [rightBtn setTitle:@"right" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
}

-(void)leftBtnClick {
    NSLog(@"leftClick");
}


-(void)rightBtnClick {
    NSLog(@"rightClick");
}



#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"测试数据---%ld", (long)indexPath.row];
    
    return cell;
}


@end
