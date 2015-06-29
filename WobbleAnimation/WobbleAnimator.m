//
//  WobbleAnimation.m
//  WobbleAnimation
//
//  Created by Jialiang Xiang on 2015-06-25.
//  Copyright (c) 2015 Jialiang Xiang. All rights reserved.
//

#import "WobbleAnimator.h"

#define ARC4RANDOM_MAX 0x100000000
#define ANIM_TOTOAL_NUM_OF_FRAME 4
#define SCREEN_FRAME_RATE_OVER_ANIM_FRAME_RATE 1

@implementation WobbleAnimator {
    CADisplayLink* displayLink;
    NSTimer* frameDurationTimer;
    CGPoint anchor;
    UIView* target;
    BOOL canGotoNextFrame;
}

- (instancetype)initWithTarget:(UIView*) t
{
    target = t;
    [self resetAnchorAndTransform];
    return self;
}

- (void)resetAnchorAndTransform
{
    anchor = CGPointMake(0.5, 0.5);
    target.layer.anchorPoint = anchor;
    target.transform = CGAffineTransformIdentity;
}

- (void)startAnimation
{
    [frameDurationTimer invalidate];
    [displayLink invalidate];
    [self resetAnchorAndTransform];
    canGotoNextFrame = YES;
    
    frameDurationTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(readyForNextFrame) userInfo:nil repeats:YES];
    
    displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(tryGotoNextFrame)];
    [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)stopAnimation
{
    [frameDurationTimer invalidate];
    [displayLink invalidate];
    canGotoNextFrame = NO;
    
    [self resetAnchorAndTransform];
}

- (void)readyForNextFrame
{
    canGotoNextFrame = YES;
}

- (void)tryGotoNextFrame
{
    if (canGotoNextFrame) {
        [self gotoNextFrame];
    }
}

- (void)gotoNextFrame
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
            target.transform = CGAffineTransformMakeRotation(0.03);
            target.layer.anchorPoint = anchor;
            break;
        }
        case 1: {
            target.transform = CGAffineTransformMakeRotation(-0.01);
            target.layer.anchorPoint = anchor;
            break;
        }
        case 2: {
            target.transform = CGAffineTransformMakeRotation(-0.06);
            target.layer.anchorPoint = anchor;
            break;
        }
        case 3: {
            target.transform = CGAffineTransformMakeRotation(-0.01);
            target.layer.anchorPoint = anchor;
            break;
        }
    }
    
    canGotoNextFrame = NO;
}

NSInteger nextFrameNum(NSInteger frameNum) {
    if (frameNum < 0) {
        return 0;
    } else if (frameNum < ANIM_TOTOAL_NUM_OF_FRAME) {
        return frameNum + 1;
    } else {
        return 0;
    }
}

@end
