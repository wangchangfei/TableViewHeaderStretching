//
//  HeaderStretchingTableViewController.h
//  TableViewHeaderStretching
//
//  Created by wangchangfei on 15/9/23.
//  Copyright © 2015年 wangchangfei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeaderStretchingTableViewController : UITableViewController
/**
 *  导航栏背景图片名称
 */
@property(nonatomic,copy)NSString* navigation_backgroundImageName;

/**
 *  头部被拉伸图片控件的高度
 */
@property (nonatomic, assign) CGFloat stretchingImageHeight;

/**
 *  头部被拉伸图片名称
 */
@property (nonatomic, copy) NSString *stretchingImageName;
@end
