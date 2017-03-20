//
//  CustomSlider.m
//  QGCustomSlider
//
//  Created by jorgon on 10/03/17.
//  Copyright © 2017年 jorgon. All rights reserved.
//
#define kCustomSliderLineW 4
#import "CustomSlider.h"

@interface CustomSlider ()
{
    CAShapeLayer * _backLineLayer;
    UIBezierPath * _backLinePath;
    CAShapeLayer * _progressLayer;
    UIBezierPath * _progressPath;
    CAShapeLayer * _thumbLayer;
    UIBezierPath * _thumbPath;
}
@property (nonatomic, copy) void((^blockname)());
@end

@implementation CustomSlider

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setPrimaryView];
        self.backgroundColor = [UIColor clearColor];
        
    }
    return self;
}
- (void)setPrimaryView
{
    _backLineLayer = [CAShapeLayer layer];
    _backLineLayer.fillColor = self.maximumTrackTintColor.CGColor?:[UIColor grayColor].CGColor;
    _backLineLayer.strokeColor = self.maximumTrackTintColor.CGColor?:[UIColor grayColor].CGColor;
    _backLineLayer.lineWidth = kCustomSliderLineW;
    _backLineLayer.lineCap = kCALineCapRound;
    _backLinePath = [UIBezierPath bezierPath];
    [self.layer addSublayer:_backLineLayer];
    
    _progressLayer = [CAShapeLayer layer];
    _progressLayer.fillColor = [UIColor clearColor].CGColor;
    _progressLayer.strokeColor = self.minimumTrackTintColor.CGColor?:[UIColor redColor].CGColor;
    _progressLayer.lineCap = kCALineCapRound;
    _progressLayer.lineWidth = kCustomSliderLineW;
    [self.layer addSublayer:_progressLayer];
    
    _thumbLayer = [CAShapeLayer layer];
    _thumbLayer.fillColor = [UIColor redColor].CGColor;
    _thumbLayer.strokeColor = [UIColor redColor].CGColor;
    [self.layer addSublayer:_thumbLayer];
    
    self.isNeedThumb = YES;
    [self setProgress:0];

}

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    CGFloat width = self.frame.size.width;
    _progressPath = [UIBezierPath bezierPath];
    [_progressPath moveToPoint:CGPointMake(0, 20)];
    [_progressPath addLineToPoint:CGPointMake(width * progress, 20)];
    _progressLayer.path = _progressPath.CGPath;
    
    _thumbPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(width * progress, 20)
                                                radius:10 startAngle:0 endAngle:360 clockwise:YES];
    _thumbLayer.path = _thumbPath.CGPath;
}

- (void)setMaximumTrackTintColor:(UIColor *)maximumTrackTintColor
{
    _maximumTrackTintColor = maximumTrackTintColor;
    _backLineLayer.strokeColor = maximumTrackTintColor.CGColor;
}

- (void)setMinimumTrackTintColor:(UIColor *)minimumTrackTintColor
{
    _minimumTrackTintColor = minimumTrackTintColor;
    _progressLayer.strokeColor = minimumTrackTintColor.CGColor;
}


- (void)setThumbTintColor:(UIColor *)thumbTintColor
{
    _thumbTintColor = thumbTintColor;
    _thumbLayer.strokeColor = thumbTintColor.CGColor;
    _thumbLayer.fillColor = thumbTintColor.CGColor;
}

- (void)setIsNeedThumb:(BOOL)isNeedThumb
{
    _isNeedThumb = isNeedThumb;
    if (isNeedThumb) {
        _thumbLayer.hidden = NO;
    }
    else
    {
        _thumbLayer.hidden = YES;
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _backLineLayer.frame = self.bounds;
    [_backLinePath moveToPoint:CGPointMake(0, self.frame.size.height / 2)];
    [_backLinePath addLineToPoint:CGPointMake(self.bounds.size.width, self.frame.size.height / 2)];
    _backLineLayer.path = _backLinePath.CGPath;
    
    _progressLayer.frame = self.bounds;
    
    _thumbLayer.frame = self.bounds;
}
- (void)drawRect:(CGRect)rect
{
    
}
@end
