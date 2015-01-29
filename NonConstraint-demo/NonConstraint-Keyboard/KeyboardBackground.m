//
//  KeyboardBackground.m
//  NonConstraint-demo
//
//  Created by luowei on 15/1/29.
//  Copyright (c) 2015年 luowei. All rights reserved.
//

#import "KeyboardBackground.h"
#import "Keyboard.h"

@implementation KeyboardBackground

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)layoutSubviews {
    [super layoutSubviews];

    for (UIView *subView in self.subviews) {
        if ([subView isKindOfClass:[Keyboard class]]) {
            subView.frame = self.frame;
        }
    }
}


@end
