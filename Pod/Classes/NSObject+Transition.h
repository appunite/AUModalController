//
//  NSObject+Transition.h
//  KingsChat
//
//  Created by Hubert Drąg on 05.11.2014.
//  Copyright (c) 2014 Appunite. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Transition)

- (UIView *)fromViewInTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext;
- (UIView *)toViewInTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext;

@end
