//
//  AUModalView.h
//  Gistr
//
//  Created by Hubert Drąg on 26.06.2014.
//  Copyright (c) 2014 Appunite. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AUModalView : UIView
@property (nonatomic, weak) UIView *contentView;
@property (nonatomic, weak) UIImageView *backgroundImageView;
@property (nonatomic, weak) UIView *overlayView;
@property (nonatomic, assign) CGSize contentViewSize;
@property (nonatomic, assign) CGPoint contentViewPosition;
@property (nonatomic, assign) UIInterfaceOrientation interfaceOrientation;

- (void)adjustModalToViewSize:(CGSize)size;
@end
