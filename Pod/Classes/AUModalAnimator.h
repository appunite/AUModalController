//
//  AUModalAnimator.h
//  Gistr
//
//  Created by Hubert Drąg on 26.06.2014.
//  Copyright (c) 2014 Appunite. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, TransitionDirection) {
    TransitionDirectionPush = 1,
    TransitionDirectionPop
};

@interface AUModalAnimator : NSObject <UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate>
@property (nonatomic, assign) NSTimeInterval transitionDuration;
@property (nonatomic, assign) TransitionDirection transitionDirection;

- (void)pushTransition:(id <UIViewControllerContextTransitioning> )transitionContext;
- (void)popTransition:(id <UIViewControllerContextTransitioning> )transitionContext;

@end
