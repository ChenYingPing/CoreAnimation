//
//  RotateViewController.m
//  CoreAnimation
//
//  Created by Chen on 15/7/30.
//  Copyright (c) 2015年 Chen. All rights reserved.
//

#import "RotateViewController.h"

#define Radius 40

@interface RotateViewController ()

@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet UIView *pinkView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@end

@implementation RotateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.blueView.layer.cornerRadius = Radius;
    self.blueView.layer.masksToBounds = YES;
    self.pinkView.layer.cornerRadius = Radius;
    self.pinkView.layer.masksToBounds = YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self subViewAnim];
    [self bottomViewAnim];
}

- (void)bottomViewAnim
{
    // 1.创建动画对象
    CABasicAnimation *anim = [CABasicAnimation animation];
    
    // 2.设置动画对象
    // keyPath决定了执行怎样的动画, 调整哪个属性来执行动画
    anim.keyPath = @"transform.rotation.y";
    anim.toValue = @(M_PI*2);
    anim.duration = 6;
    anim.repeatCount = MAXFLOAT;
    // 3.添加动画
    [self.bottomView.layer addAnimation:anim forKey:nil];
}

- (void)subViewAnim
{
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    
    anim.keyPath = @"transform.rotation.y";
    
    NSValue *v1 = @(-M_PI*2);
    NSValue *v2 = @(M_PI*2);
    anim.values = @[v1, v2,v1];
    
    anim.duration = 36;
    // 动画的重复执行次数
    anim.repeatCount = MAXFLOAT;
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    
    [self.blueView.layer addAnimation:anim forKey:nil];
    [self.pinkView.layer addAnimation:anim forKey:nil];
}

@end
