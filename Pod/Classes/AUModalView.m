//
//  AUModalView.m
//  Gistr
//
//  Created by Hubert Drąg on 26.06.2014.
//  Copyright (c) 2014 Appunite. All rights reserved.
//

#import "AUModalView.h"

@implementation AUModalView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImageView *imageView = [UIImageView new];
        [self addSubview:imageView];
        imageView.frame = self.bounds;
        _backgroundImageView = imageView;
        [_backgroundImageView setContentMode:UIViewContentModeScaleAspectFill];
        
        UIView *overlayView = [[UIView alloc] init];
        overlayView.frame = self.bounds;
        [overlayView setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.75]];
        [self addSubview:overlayView];
        _overlayView = overlayView;
        
        UIView *view = [UIView new];
        [self addSubview:view];
        _contentView = view;
        [self setClipsToBounds:NO];
    }
    return self;
}

- (void)setContentView:(UIView *)contentView {
    if (_contentView != contentView) {
        if (_contentView) {
            [_contentView removeFromSuperview];
        }
        _contentView = contentView;
        [self addSubview:contentView];
        [self setNeedsDisplay];
    }
}

- (CGPoint)contentViewPosition {
    if (CGPointEqualToPoint(_contentViewPosition, CGPointZero)) {
        CGRect rect = _backgroundImageView.frame;
        return CGPointMake(CGRectGetMidX(rect) - 0.5f * self.contentViewSize.width, CGRectGetMidY(rect) - 0.5f * self.contentViewSize.height);
    }
    return _contentViewPosition;
}

- (void)adjustModalToViewSize:(CGSize)size {
    _backgroundImageView.frame = CGRectMake(0,0,size.width,size.height);
    _overlayView.frame = CGRectMake(0,0,size.width,size.height);
    
    CGRect contentViewRect = CGRectMake(self.contentViewPosition.x, self.contentViewPosition.y, self.contentViewSize.width, self.contentViewSize.height);
    self.contentView.frame = contentViewRect;
}

@end
