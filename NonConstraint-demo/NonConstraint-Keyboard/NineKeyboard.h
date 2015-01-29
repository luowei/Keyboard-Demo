//
//  NineKeyboard.h
//  Constraint-demo
//
//  Created by luowei on 15/1/15.
//  Copyright (c) 2015年 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Keyboard.h"

@class KeyBtn;

@interface NineKeyboard : Keyboard

@property (weak, nonatomic) IBOutlet KeyBtn *symbolBtn;
@property (weak, nonatomic) IBOutlet KeyBtn *languageBtn;
@property (weak, nonatomic) IBOutlet KeyBtn *nextBtn;
@property (weak, nonatomic) IBOutlet KeyBtn *numBtn;


@end
	