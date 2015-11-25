//
//  AUModalController.h
//  Gistr
//
//  Created by Hubert Drąg on 26.06.2014.
//  Copyright (c) 2014 Appunite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AUModalDismissDelegate.h"

@interface AUModalController : UIViewController <AUModalDismissDelegate>

@property (nonatomic, strong) UIViewController *contentViewController;
@property (nonatomic, strong) UIImage *backgroundImage;
@property (nonatomic, assign) CGSize modalSize;
@property (nonatomic, assign) CGPoint modalPosition;
@property (nonatomic, assign) BOOL hideOnClick;

- (id)initWithContentViewController:(UIViewController *)contentViewController;
@end
