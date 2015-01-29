//
//  NumKeyboard.h
//  Constraint-demo
//
//  Created by luowei on 15/1/15.
//  Copyright (c) 2015年 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Keyboard.h"

@class KeyBtn;

@interface NumKeyboard : Keyboard

@property (weak, nonatomic) IBOutlet KeyBtn *symbolBtn;
@property (weak, nonatomic) IBOutlet KeyBtn *backBtn;


@end
