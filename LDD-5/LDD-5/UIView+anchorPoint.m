//
//  LDDAnimation.h
//  LDD-5
//
//  Created by 李洞洞 on 21/7/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import "UIView+anchorPoint.h"

@implementation UIView (anchorPoint)
/*
 (0, 0.5)
 */
/*
 原锚点是(0.5,0.5)
 */
- (void)setAnchorPointTo:(CGPoint)point{
    self.frame = CGRectOffset(self.frame, (point.x - self.layer.anchorPoint.x) * self.frame.size.width, (point.y - self.layer.anchorPoint.y) * self.frame.size.height);
    
    self.layer.anchorPoint = point;
}

@end
