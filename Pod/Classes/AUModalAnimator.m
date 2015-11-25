//
//  AUModalAnimator.m
//  Gistr
//
//  Created by Hubert Drąg on 26.06.2014.
//  Copyright (c) 2014 Appunite. All rights reserved.
//

#import "AUModalAnimator.h"

#import "AUModalView.h"
#import "AUModalController.h"
#import "UIViewController+Snapshot.h"

#import "NSObject+Transition.h"

@implementation AUModalAnimator

- (id)init {
    self = [super init];
    if (self) {
        self.transitionDuration = 0.5f;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning> )transitionContext {
    return self.transitionDuration;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning> )transitionContext {
    if (self.transitionDirection == TransitionDirectionPush) {
        [self pushTransition:transitionContext];
        
    } else if (self.transitionDirection == TransitionDirectionPop) {
        [self popTransition:transitionContext];
    }
}

- (void)pushTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    // get view controllers
    AUModalController *toVC = (AUModalController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIImage *image = [fromVC viewSnapshot];
    
    UIView *fromView = [self fromViewInTransitionContext:transitionContext];
    
    // rect
    CGRect destinationRect = [[UIScreen mainScreen] bounds];
    
    toVC.view.frame = destinationRect;
    AUModalView *view = (AUModalView *)toVC.view;
    [view.backgroundImageView setImage:image];
    
    UIView *contentView = view.contentView;
    CGRect stopRect = CGRectMake(CGRectGetMidX(destinationRect) - view.contentViewSize.width * 0.5f, CGRectGetMidY(destinationRect) - view.contentViewSize.height * 0.5f, view.contentViewSize.width, view.contentViewSize.height);

    CGRect startRect = stopRect;
    startRect.origin.y += CGRectGetHeight(destinationRect);
    contentView.frame = startRect;
    
    UIView *container = [transitionContext containerView];
    [container addSubview:toVC.view];
    
    [UIView animateWithDuration:self.transitionDuration delay:0.0f usingSpringWithDamping:0.7f initialSpringVelocity:0.2f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        contentView.frame = stopRect;
    } completion:^(BOOL finished) {
        [fromView removeFromSuperview];
        [transitionContext completeTransition:YES];
    }];

}

- (void)popTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    // get view controllers
    AUModalController *fromVC = (AUModalController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    // rect
    CGRect destinationRect = [[UIScreen mainScreen] applicationFrame];
    
    UIView *fromView = [self fromViewInTransitionContext:transitionContext];
    AUModalView *view = (AUModalView *)fromView;
    
    UIView *contentView = view.contentView;
    CGRect startRect = contentView.frame;
    CGRect stopRect = startRect;
    stopRect.origin.y += CGRectGetHeight(destinationRect);
    
    
    UIView *container = [transitionContext containerView];
    [container insertSubview:toVC.view belowSubview:fromVC.view];
    
    [UIView animateWithDuration:self.transitionDuration animations:^{
        contentView.frame = stopRect;
        
    } completion:^(BOOL finished) {
        [fromView removeFromSuperview];
        [transitionContext completeTransition:YES];
    }];
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                   presentingController:(UIViewController *)presenting
                                                                       sourceController:(UIViewController *)source {
    self.transitionDirection = TransitionDirectionPush;
    return self;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {        self.transitionDirection = TransitionDirectionPop;
    return self;
}

@end
