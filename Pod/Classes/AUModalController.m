//
//  AUModalController.m
//  Gistr
//
//  Created by Hubert Drąg on 26.06.2014.
//  Copyright (c) 2014 Appunite. All rights reserved.
//

#import "AUModalController.h"
#import "AUModalView.h"

@implementation AUModalController {
    __weak AUModalView *_mainView;
}

- (id)initWithContentViewController:(UIViewController *)contentViewController {
    self = [super init];
    if (self) {
        self.contentViewController = contentViewController;
        _hideOnClick = YES;
    }
    return self;
}

- (void)loadView {
    CGRect rect = [[UIScreen mainScreen] bounds];
    
    AUModalView *view = [[AUModalView alloc] initWithFrame:rect];
    view.contentMode = UIViewContentModeScaleAspectFill;
    self.view = view;
    _mainView = view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _mainView.contentViewSize = CGSizeEqualToSize(CGSizeZero, _modalSize) ? CGSizeMake(320, 568) : _modalSize;
    _mainView.contentViewPosition = self.modalPosition;
    _mainView.contentView = self.contentViewController.view;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    [_mainView.overlayView addGestureRecognizer:tapGesture];
}

- (void)handleTapGesture:(UITapGestureRecognizer *)tapGesture {
    if (!self.hideOnClick) {
        return;
    }

    CGPoint gestureLocation = [tapGesture locationInView:self.view];
    CGRect contentViewRect = [self.view convertRect:_mainView.contentView.frame fromView:_mainView];
    
    if (!CGRectContainsPoint(contentViewRect, gestureLocation)) {
        [self dismissViewController:self.contentViewController];
    }
}

- (void)setContentViewController:(UIViewController *)contentViewController {
    _contentViewController = contentViewController;
}

- (void)dismissViewController:(UIViewController *)viewController {
    [self dismissViewController:viewController completion:nil];
}

- (void)dismissViewController:(UIViewController *)viewController completion:(void (^)(void))completion {
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [self dismissViewControllerAnimated:YES completion:completion];
}

#pragma mark
#pragma mark - Rotation

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [_mainView setInterfaceOrientation:toInterfaceOrientation];
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [_mainView adjustModalToViewSize:size];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

@end
