//
//  CustomSlider.h
//  QGCustomSlider
//
//  Created by jorgon on 10/03/17.
//  Copyright © 2017年 jorgon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomSlider : UIView
@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, strong) UIColor * minimumTrackTintColor;
@property (nonatomic, strong) UIColor * maximumTrackTintColor;
@property (nonatomic, strong) UIColor * thumbTintColor;
@property (nonatomic, assign) BOOL isNeedThumb;
@end
