//
//  AUModalViewController.h
//  SuperUser
//
//  Created by Krzysztof Kapitan on 01.09.2015.
//  Copyright (c) 2015 com.appunite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AUModalController.h"
@interface AUModalViewController : UIViewController

@property (nonatomic,strong) AUModalController *dismissDelegate;
@property (nonatomic,strong) UIViewController *su_parentViewController;

@end
