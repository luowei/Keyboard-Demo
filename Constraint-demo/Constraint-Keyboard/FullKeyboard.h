//
//  FullKeyboard.h
//  Constraint-demo
//
//  Created by luowei on 15/1/9.
//  Copyright (c) 2015年 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KeyBtn;

@interface FullKeyboard : UIView

@property (weak, nonatomic) IBOutlet KeyBtn *nextBtn;

@property (weak, nonatomic) IBOutlet KeyBtn *numBtn;
@property (weak, nonatomic) IBOutlet KeyBtn *languageBtn;
@property (weak, nonatomic) IBOutlet KeyBtn *symbolBtn;

@end
