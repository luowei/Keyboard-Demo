//
//  KeyboardViewController.h
//  Constraint-Keyboard
//
//  Created by luowei on 15/1/9.
//  Copyright (c) 2015年 luowei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FullKeyboard;
@class NumKeyboard;
@class NineKeyboard;
@class SymbolKeyboard;
@class KeyboardBackground;
@class InputView;

@interface KeyboardViewController : UIInputViewController

@property(nonatomic, strong) InputView *inputView;
@property(nonatomic, strong) KeyboardBackground *backgroundView;


@property(nonatomic, strong) UIView *currentKeyboard;

@property(nonatomic, strong) FullKeyboard *fullKeyboard;
@property(nonatomic, strong) NumKeyboard *numKeyboard;
@property(nonatomic, strong) NineKeyboard *nineKeyboard;
@property(nonatomic, strong) SymbolKeyboard *symbolKeyboard;

@property(nonatomic, strong) NSArray *keyboardVerticalConstraints;
@property(nonatomic, strong) NSArray *keyboardHorizonConstraints;


@property(nonatomic) BOOL singleHand;


@end
