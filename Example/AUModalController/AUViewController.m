//
//  AUViewController.m
//  AUModalController
//
//  Created by Krzysztof on 11/25/2015.
//  Copyright (c) 2015 Krzysztof. All rights reserved.
//

#import "AUViewController.h"
#import "AUPopupViewController.h"

#import <AUModalController/AUModalViewController.h>
#import <AUModalController/AUModalAnimator.h>

@interface AUViewController ()
@property (strong, nonatomic) AUModalAnimator *modalAnimator;
@end

@implementation AUViewController


- (IBAction)tapAction:(id)sender {
    AUPopupViewController *popup = [[UIStoryboard storyboardWithName:@"WelcomeModal" bundle:nil] instantiateInitialViewController];
    [self presentPopup:popup];
}

- (void)presentPopup:(AUModalViewController *)popup {
    
    self.modalAnimator = [AUModalAnimator new];
    AUModalController *modalController = [[AUModalController alloc] initWithContentViewController:popup];
    modalController.modalSize = CGSizeMake(320.f, 580.f);
    modalController.transitioningDelegate = self.modalAnimator;
    modalController.modalPresentationStyle = UIModalPresentationCustom;
    popup.dismissDelegate = modalController;
    [self presentViewController:modalController animated:YES completion:nil];
}

@end
