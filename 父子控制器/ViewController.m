//
//  ViewController.m
//  父子控制器
//
//  Created by imac on 2016/10/26.
//  Copyright © 2016年 imac. All rights reserved.
//

#import "ViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
@interface ViewController ()

//当前控制器
@property (nonatomic, weak) UIViewController *currentVC;

//子控制器1
@property (nonatomic,strong)OneViewController *oneVc;
//子控制器2
@property (nonatomic,strong)TwoViewController *twoVc;
//子控制器3
@property (nonatomic,strong)ThreeViewController *threeVc;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.oneVc = [[OneViewController alloc]init];
    self.twoVc = [[TwoViewController alloc]init];
    self.threeVc = [[ThreeViewController alloc]init];
    
    //先后顺序不要搞混,那个拍前边就写前边
    [self addChildViewController:self.oneVc];
    [self addChildViewController:self.twoVc];
    [self addChildViewController:self.threeVc];
    
    
    //默认选择第一个子控制器
    [self clickMenu:nil];
}


- (IBAction)clickMenu:(UIButton *)btn {
    // 取出选中的这个控制器
    
    //写法一:
    //UIViewController *oneVc = self.childViewControllers[0];
    
    //写法二:
    self.oneVc = (OneViewController *)self.childViewControllers[0];
    // 设置尺寸位置
    self.oneVc.view.frame = CGRectMake(0, 70, self.view.frame.size.width, self.view.frame.size.height - 50);
    // 移除掉当前显示的控制器的view（移除的是view，而不是控制器）
    [self.currentVC.view removeFromSuperview];
    // 把选中的控制器view显示到界面上
    [self.view addSubview:self.oneVc.view];
    self.currentVC = self.oneVc;
}


- (IBAction)clickMenu2:(UIButton *)btn {
    // 取出选中的这个控制器
    self.twoVc = (TwoViewController *)self.childViewControllers[1];
    // 设置尺寸位置
    self.twoVc.view.frame = CGRectMake(0, 70, self.view.frame.size.width, self.view.frame.size.height - 50);
    // 移除掉当前显示的控制器的view（移除的是view，而不是控制器）
    [self.currentVC.view removeFromSuperview];
    // 把选中的控制器view显示到界面上
    [self.view addSubview:self.twoVc.view];
    self.currentVC = self.twoVc;
}

- (IBAction)clickMenu3:(UIButton *)btn {
    // 取出选中的这个控制器
    self.threeVc = (ThreeViewController *)self.childViewControllers[2];
    // 设置尺寸位置
    self.threeVc.view.frame = CGRectMake(0, 70, self.view.frame.size.width, self.view.frame.size.height - 50);
    // 移除掉当前显示的控制器的view（移除的是view，而不是控制器）
    [self.currentVC.view removeFromSuperview];
    // 把选中的控制器view显示到界面上
    [self.view addSubview:self.threeVc.view];
    self.currentVC = self.threeVc;
}
@end
