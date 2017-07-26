//
//  LDDAnimation.h
//  LDD-5
//
//  Created by 李洞洞 on 21/7/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger,LDDAnimationType) {
    LDDAnimationTypePush,
    LDDAnimationTypePop
};
@interface LDDAnimation : NSObject<UIViewControllerAnimatedTransitioning>
+ (instancetype)lddAnimation:(LDDAnimationType)type;
- (instancetype)initWithAnimation:(LDDAnimationType)type;
@end
