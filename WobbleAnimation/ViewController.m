//
//  ViewController.m
//  WobbleAnimation
//
//  Created by Jialiang Xiang on 2015-06-25.
//  Copyright (c) 2015 Jialiang Xiang. All rights reserved.
//

#import "ViewController.h"
#define ARC4RANDOM_MAX 0x100000000
#define ANIM_TOTOAL_NUM_OF_FRAME 4
#define SCREEN_FRAME_RATE_OVER_ANIM_FRAME_RATE 1
@interface ViewController ()

@end

@implementation ViewController {
    UIView* redView;
    CADisplayLink* displayLink;
    CGPoint anchor;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    redView = [[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, 100, 100)];
    redView.layer.cornerRadius = 20.0;
    redView.backgroundColor = [UIColor redColor];
    redView.center = self.view.center;
    redView.layer.allowsEdgeAntialiasing = YES;
    [self.view addSubview:redView];
    
    anchor = CGPointMake(0.5, 0.5);
    
    displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(nextFrame)];
    [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)nextFrame
{
    static NSInteger animFrameNum = 0;
    static NSInteger screenFrameCounter = 0;
    
    if (screenFrameCounter > SCREEN_FRAME_RATE_OVER_ANIM_FRAME_RATE) {
        animFrameNum = nextFrameNum(animFrameNum);
        anchor = CGPointMake(0.49 + ((float)random() / ARC4RANDOM_MAX) * 0.02, 0.49 + ((float)random() / ARC4RANDOM_MAX) * 0.02);
        screenFrameCounter = 0;
    } else {
        screenFrameCounter++;
    }
    
    switch (animFrameNum) {
        case 0: {
            redView.transform = CGAffineTransformMakeRotation(0.03);
            redView.layer.anchorPoint = anchor;
            break;
        }
        case 1: {
            redView.transform = CGAffineTransformMakeRotation(-0.01);
            redView.layer.anchorPoint = anchor;
            break;
        }
        case 2: {
            redView.transform = CGAffineTransformMakeRotation(-0.06);
            redView.layer.anchorPoint = anchor;
            break;
        }
        case 3: {
            redView.transform = CGAffineTransformMakeRotation(-0.01);
            redView.layer.anchorPoint = anchor;
            break;
        }
            //        case 4: {
            //            redView.transform = CGAffineTransformMakeRotation(-0.01);
            //            redView.layer.anchorPoint = anchor;
            //            break;
            //        }
            //        case 5: {
            //            redView.transform = CGAffineTransformMakeRotation(0.01);
            //            redView.layer.anchorPoint = anchor;
            //            break;
            //        }
            //        case 6: {
            //            redView.transform = CGAffineTransformMakeRotation(0.0);
            //            redView.layer.anchorPoint = anchor;
            //            break;
            //        }
            //        case 7: {
            //            redView.transform = CGAffineTransformMakeRotation(0.025);
            //            redView.layer.anchorPoint = anchor;
            //            break;
            //        }
    }
}

NSInteger nextFrameNum(NSInteger flag) {
    if (flag < 0) {
        return 0;
    } else if (flag < ANIM_TOTOAL_NUM_OF_FRAME) {
        return flag + 1;
    } else {
        return 0;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
