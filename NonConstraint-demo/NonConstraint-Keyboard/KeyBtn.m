//
//  KeyBtn.m
//  Constraint-demo
//
//  Created by luowei on 15/1/15.
//  Copyright (c) 2015年 luowei. All rights reserved.
//

#import "KeyBtn.h"

@implementation KeyBtn

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.btnImage = [self viewWithTag:1001];
        self.btnImage.backgroundColor = [UIColor whiteColor];
        self.btnImage.userInteractionEnabled = NO;
    }

    return self;
}


@end
