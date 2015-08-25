//
//  ViewController.m
//  CoreAnimation
//
//  Created by Chen on 15/7/29.
//  Copyright (c) 2015年 Chen. All rights reserved.
//

#import "ViewController.h"

#define headTime 0.8
#define bodyTime 0.8
#define Radius 5.0

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *firstView;
@property (weak, nonatomic) IBOutlet UIView *secondView;
@property (weak, nonatomic) IBOutlet UIView *thirdView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.firstView.layer.cornerRadius = Radius;
    self.firstView.layer.masksToBounds = YES;
    self.secondView.layer.cornerRadius = Radius;
    self.secondView.layer.masksToBounds = YES;
    self.thirdView.layer.cornerRadius = Radius;
    self.thirdView.layer.masksToBounds = YES;
    
    [self begin];
    
    [NSTimer scheduledTimerWithTimeInterval:2*headTime+bodyTime+0.2 target:self selector:@selector(begin) userInfo:nil repeats:YES];
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self begin];
}

- (void)begin{
    [self firstAnimation];
    [self performSelector:@selector(secondAnimation) withObject:nil afterDelay:headTime];
    [self performSelector:@selector(thirdAnimation) withObject:nil afterDelay:bodyTime + headTime];
}

/**
 *  firstView从左往右移动
 */
- (void)firstAnimation
{
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    
    anim.keyPath = @"position";
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    anim.duration = headTime;
    
    NSValue *v1 = [NSValue valueWithCGPoint:CGPointMake(115, 200)];
    NSValue *v2 = [NSValue valueWithCGPoint:CGPointMake(130, 200)];
    anim.values = @[v1, v2];
    
    [self.firstView.layer addAnimation:anim forKey:nil];
    
    CABasicAnimation * basicAnim = [CABasicAnimation animation];
    basicAnim.toValue = (id)[UIColor colorWithRed:55/256.0 green:155/256.0 blue:252/256.0 alpha:1].CGColor; //55 255 252
    basicAnim.duration = headTime;
    basicAnim.removedOnCompletion = NO;
    basicAnim.fillMode = kCAFillModeForwards;
    [self.firstView.layer addAnimation:basicAnim forKey:@"backgroundColor"];
}

/**
 *  三个View一起往右移动
 */
- (void)secondAnimation
{
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    
    anim.keyPath = @"position";
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    anim.duration = bodyTime;
    
    NSValue *v1 = [NSValue valueWithCGPoint:CGPointMake(130, 200)];
    NSValue *v2 = [NSValue valueWithCGPoint:CGPointMake(145, 200)];
    anim.values = @[v1, v2];
    
    [self.firstView.layer addAnimation:anim forKey:nil];
    
    CAKeyframeAnimation *anim2 = [CAKeyframeAnimation animation];
    
    anim2.keyPath = @"position";
    anim2.removedOnCompletion = NO;
    anim2.fillMode = kCAFillModeForwards;
    anim2.duration = bodyTime;
    
    NSValue *v3 = [NSValue valueWithCGPoint:CGPointMake(145, 200)];
    NSValue *v4 = [NSValue valueWithCGPoint:CGPointMake(160, 200)];
    anim2.values = @[v3, v4];
    
    [self.secondView.layer addAnimation:anim2 forKey:nil];
    
    CAKeyframeAnimation *anim3 = [CAKeyframeAnimation animation];
    
    anim3.keyPath = @"position";
    anim3.removedOnCompletion = NO;
    anim3.fillMode = kCAFillModeForwards;
    anim3.duration = bodyTime;
    
    NSValue *v5 = [NSValue valueWithCGPoint:CGPointMake(160, 200)];
    NSValue *v6 = [NSValue valueWithCGPoint:CGPointMake(175, 200)];
    anim3.values = @[v5, v6];
    
    [self.thirdView.layer addAnimation:anim3 forKey:nil];
}

/**
 *  thirdView单独向右移动
 */
- (void)thirdAnimation
{
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    
    anim.keyPath = @"position";
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    anim.duration = headTime;
    anim.delegate = self;
    NSValue *v1 = [NSValue valueWithCGPoint:CGPointMake(175, 200)];
    NSValue *v2 = [NSValue valueWithCGPoint:CGPointMake(190, 200)];
    anim.values = @[v1, v2];
    
    [self.thirdView.layer addAnimation:anim forKey:nil];
    
    CABasicAnimation * basicAnim = [CABasicAnimation animation];
    basicAnim.toValue = (id)[UIColor clearColor].CGColor;
    basicAnim.duration = headTime;
    basicAnim.removedOnCompletion = NO;
    basicAnim.fillMode = kCAFillModeForwards;
    [self.thirdView.layer addAnimation:basicAnim forKey:@"backgroundColor"];
}

#pragma mark 动画结束的时候调用
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    //让所有View回归原位
     [self.firstView.layer removeAllAnimations];
     [self.secondView.layer removeAllAnimations];
     [self.thirdView.layer removeAllAnimations];
}
@end
