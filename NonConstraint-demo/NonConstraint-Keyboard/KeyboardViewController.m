//
//  KeyboardViewController.m
//  Constraint-Keyboard
//
//  Created by luowei on 15/1/9.
//  Copyright (c) 2015年 luowei. All rights reserved.
//

#import "KeyboardViewController.h"
#import "FullKeyboard.h"
#import "KeyBtn.h"
#import "NumKeyboard.h"
#import "NineKeyboard.h"
#import "SymbolKeyboard.h"

@interface KeyboardViewController ()
@end

@implementation KeyboardViewController

- (void)updateViewConstraints {
    [super updateViewConstraints];

}


- (void)loadView {
    [super loadView];

    self.view.backgroundColor = [UIColor greenColor];

    self.fullKeyboard = [self loadFullKeyboard];
    self.currentKeyboard = self.fullKeyboard;

}

- (FullKeyboard *)loadFullKeyboard {
    if (!_fullKeyboard) {
        self.fullKeyboard = [[NSBundle mainBundle] loadNibNamed:@"FullKeyboard" owner:self.view options:nil][0];
        [self.view addSubview:self.fullKeyboard];

        [self.fullKeyboard.nextBtn addTarget:self action:@selector(advanceToNextInputMode) forControlEvents:UIControlEventTouchUpInside];
        [self.fullKeyboard.numBtn addTarget:self action:@selector(goToNumKeyboard) forControlEvents:UIControlEventTouchUpInside];
        [self.fullKeyboard.symbolBtn addTarget:self action:@selector(goToSymbolKeyboard) forControlEvents:UIControlEventTouchUpInside];
        [self.fullKeyboard.languageBtn addTarget:self action:@selector(goToNineKeyboard) forControlEvents:UIControlEventTouchUpInside];
    }

    self.fullKeyboard.hidden = NO;
    self.currentKeyboard = self.fullKeyboard;
    return _fullKeyboard;
}


- (NumKeyboard *)loadNumKeyboard {
    if (!_numKeyboard) {
        self.numKeyboard = [[NSBundle mainBundle] loadNibNamed:@"NumKeyboard" owner:self.view options:nil][0];
        [self.view addSubview:self.numKeyboard];

        [self.numKeyboard.backBtn addTarget:self action:@selector(backToPreKeyboard) forControlEvents:UIControlEventTouchUpInside];
        [self.numKeyboard.symbolBtn addTarget:self action:@selector(goToSymbolKeyboard) forControlEvents:UIControlEventTouchUpInside];
    }
    self.numKeyboard.hidden = NO;
    self.currentKeyboard = self.numKeyboard;
    return _numKeyboard;
}

- (NineKeyboard *)loadNineKeyboard {
    if (!_nineKeyboard) {
        self.nineKeyboard = [[NSBundle mainBundle] loadNibNamed:@"NineKeyboard" owner:self.view options:nil][0];
        [self.view addSubview:self.nineKeyboard];

        [self.nineKeyboard.nextBtn addTarget:self action:@selector(advanceToNextInputMode) forControlEvents:UIControlEventTouchUpInside];
        [self.nineKeyboard.numBtn addTarget:self action:@selector(goToNumKeyboard) forControlEvents:UIControlEventTouchUpInside];
        [self.nineKeyboard.symbolBtn addTarget:self action:@selector(goToSymbolKeyboard) forControlEvents:UIControlEventTouchUpInside];
        [self.nineKeyboard.languageBtn addTarget:self action:@selector(goToNineKeyboard) forControlEvents:UIControlEventTouchUpInside];
    }
    self.nineKeyboard.hidden = NO;
    self.currentKeyboard = self.nineKeyboard;
    return _nineKeyboard;
}

- (SymbolKeyboard *)loadSymbolKeyboard {
    if (!_symbolKeyboard) {
        self.symbolKeyboard = [[NSBundle mainBundle] loadNibNamed:@"SymbolKeyboard" owner:self.view options:nil][0];
        [self.view addSubview:self.symbolKeyboard];

        [self.symbolKeyboard.nextBtn addTarget:self action:@selector(advanceToNextInputMode) forControlEvents:UIControlEventTouchUpInside];
        [self.symbolKeyboard.languageBtn addTarget:self action:@selector(goToNineKeyboard) forControlEvents:UIControlEventTouchUpInside];
        [self.symbolKeyboard.numBtn addTarget:self action:@selector(goToNumKeyboard) forControlEvents:UIControlEventTouchUpInside];
    }
    self.symbolKeyboard.hidden = NO;
    self.currentKeyboard = self.symbolKeyboard;
    return _symbolKeyboard;
}


- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated
}

- (void)textWillChange:(id <UITextInput>)textInput {
    // The app is about to change the document's contents. Perform any preparation here.
}

- (void)textDidChange:(id <UITextInput>)textInput {
    // The app has just changed the document's contents, the document context has been updated.

}

- (void)advanceToNextInputMode {
    NSLog(@"===== advanceToNextInputMode ======");
    [super advanceToNextInputMode];
}


- (void)goToNineKeyboard {
    self.currentKeyboard.hidden = YES;
    [self loadNineKeyboard];
}

- (void)goToSymbolKeyboard {
    self.currentKeyboard.hidden = YES;
    [self loadSymbolKeyboard];
}

- (void)goToNumKeyboard {
    self.currentKeyboard.hidden = YES;
    [self loadNumKeyboard];
}


- (void)backToPreKeyboard {
    self.currentKeyboard.hidden = YES;
    [self loadFullKeyboard];
}

@end
