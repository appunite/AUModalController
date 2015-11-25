//
//  AUPopupViewController.m
//  AUModalController
//
//  Created by Krzysztof Kapitan on 25.11.2015.
//  Copyright © 2015 Krzysztof. All rights reserved.
//

#import "AUPopupViewController.h"

@interface AUPopupViewController ()

@end

@implementation AUPopupViewController

- (IBAction)okButtonAction:(id)sender {
    if ([self.dismissDelegate respondsToSelector:@selector(dismissViewController:)]) {
        [self.dismissDelegate dismissViewController:self];
    }
}

- (IBAction)cancelButtonAction:(id)sender {
    if ([self.dismissDelegate respondsToSelector:@selector(dismissViewController:)]) {
        [self.dismissDelegate dismissViewController:self];
    }
}

- (BOOL)shouldAutorotate {
    return YES;
}

@end
