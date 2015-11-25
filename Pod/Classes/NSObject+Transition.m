//
//  NSObject+Transition.m
//  KingsChat
//
//  Created by Hubert Drąg on 05.11.2014.
//  Copyright (c) 2014 Appunite. All rights reserved.
//

#import "NSObject+Transition.h"

#define IS_IOS_8() (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_7_1)


@implementation NSObject (Transition)

- (UIView *)fromViewInTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *fromView;
    
    if (IS_IOS_8()) {
        fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    } else {
        fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    }
    
    return fromView;
}

- (UIView *)toViewInTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *fromView;
    
    if (IS_IOS_8()) {
        fromView = [transitionContext viewForKey:UITransitionContextToViewKey];
    } else {
        fromView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    }
    
    return fromView;
}

@end
