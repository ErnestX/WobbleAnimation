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
    WobbleAnimator* animator;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    redView = [[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, 200, 200)];
    redView.layer.cornerRadius = 20.0;
    redView.backgroundColor = [UIColor redColor];
    redView.center = self.view.center;
    redView.layer.allowsEdgeAntialiasing = YES;
    [self.view addSubview:redView];
    
    // set up animator
    animator = [[WobbleAnimator alloc]initWithTarget:redView];
}

- (IBAction)startButtonPressed:(id)sender {
    [animator startAnimation];
}

- (IBAction)stopButtonPressed:(id)sender {
    [animator stopAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
