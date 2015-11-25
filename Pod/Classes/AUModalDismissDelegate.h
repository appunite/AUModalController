//
//  AUModalDismissDelegate.h
//  Gistr
//
//  Created by Hubert Drąg on 26.06.2014.
//  Copyright (c) 2014 Appunite. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AUModalDismissDelegate <NSObject>
- (void)dismissViewController:(UIViewController *)viewController;
- (void)dismissViewController:(UIViewController *)viewController completion:(void (^)(void))completion;
@end
