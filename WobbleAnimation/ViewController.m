//
//  ViewController.m
//  WobbleAnimation
//
//  Created by Jialiang Xiang on 2015-06-25.
//  Copyright (c) 2015 Jialiang Xiang. All rights reserved.
//

#import "ViewController.h"
#import "WobbleAnimator.h"

@interface ViewController ()

@end

@implementation ViewController {
    UIView* redView;
    UIView* blueView;
    
    WobbleAnimator* animator1;
    WobbleAnimator* animator2;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    redView = [[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, 200, 200)];
    redView.center = CGPointMake(self.view.center.x - 150.0, self.view.center.y);
    redView.layer.cornerRadius = 20.0;
    redView.backgroundColor = [UIColor redColor];
    redView.layer.allowsEdgeAntialiasing = YES;
    [self.view addSubview:redView];
    
    blueView = [[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, 200, 200)];
    blueView.center = CGPointMake(self.view.center.x + 150.0, self.view.center.y);
    blueView.layer.cornerRadius = 20.0;
    blueView.backgroundColor = [UIColor blueColor];
    blueView.layer.allowsEdgeAntialiasing = YES;
    [self.view addSubview:blueView];
    
    // set up animator
    animator1 = [[WobbleAnimator alloc]initWithTarget:redView];
    animator2 = [[WobbleAnimator alloc]initWithTarget:blueView];
}

- (IBAction)startButtonPressed:(id)sender {
    [animator1 startAnimation];
    [animator2 startAnimation];
}

- (IBAction)stopButtonPressed:(id)sender {
    [animator1 stopAnimation];
    [animator2 stopAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
