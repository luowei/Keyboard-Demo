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
#import "KeyboardBackground.h"
#import "InputView.h"
#import "Define.h"

@interface KeyboardViewController ()
@property(nonatomic, strong) NSLayoutConstraint *inputViewHeightConstraint;
@end

@implementation KeyboardViewController

- (void)updateViewConstraints {
    [super updateViewConstraints];

}


- (void)loadView {
    [super loadView];
    self.inputView = [[InputView alloc] initWithFrame:CGRectZero];
    self.inputView.backgroundColor = [UIColor greenColor];

    self.backgroundView = [[KeyboardBackground alloc] initWithFrame:CGRectZero];
    self.backgroundView.backgroundColor = [UIColor yellowColor];
    [self.inputView addSubview:self.backgroundView];

}


- (void)viewDidLoad {
    [super viewDidLoad];

    //添加inputView的遮罩层
    [self addInputCover];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self updateInputViewConstraints];

    //更新backgroundView
    [self updateBackgroundView];

    self.fullKeyboard = [self loadFullKeyboard];
    self.currentKeyboard = self.fullKeyboard;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
//    [self updateInputViewConstraints];
//    [self updateBackgroundView];
}


- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
    [self updateInputViewConstraints];
    [self updateBackgroundView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated
}


- (void)addInputCover {
    //这个view不显示，用来修改inputview 高度
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    view.hidden = YES;
    [self.inputView addSubview:view];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [self.inputView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[view]|"
                                                                           options:0
                                                                           metrics:nil
                                                                             views:@{@"view" : view}]];
    [self.inputView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|"
                                                                           options:0
                                                                           metrics:nil
                                                                             views:@{@"view" : view}]];
}

- (void)updateInputViewConstraints {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGFloat inputHeight = (CGFloat) (screenSize.width > screenSize.height ? INPUT_LANDSCAPE_HEIGHT : INPUT_HEIGHT);

    //设置inputView为全屏显示
//    CGFloat inputHeight = screenSize.height;
    [self.inputView removeConstraint:self.inputViewHeightConstraint];
    self.inputViewHeightConstraint = [NSLayoutConstraint constraintWithItem:self.inputView
                                                                  attribute:NSLayoutAttributeHeight
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:nil
                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                 multiplier:1
                                                                   constant:inputHeight];
    [self.inputView addConstraint:self.inputViewHeightConstraint];
    [self.inputView updateConstraints];
}

- (void)updateBackgroundView {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGFloat inputHeight = (CGFloat) (screenSize.width > screenSize.height ? INPUT_LANDSCAPE_HEIGHT : INPUT_HEIGHT);

    CGRect frame = CGRectMake(0, 0, screenSize.width, inputHeight);
    if (self.singleHand) {
        frame = CGRectMake(0, 0, SINGLEHAND_WIDTH, inputHeight);
    }
    self.backgroundView.frame = frame;
}

- (FullKeyboard *)loadFullKeyboard {
    if (!_fullKeyboard) {
        self.fullKeyboard = [[NSBundle mainBundle] loadNibNamed:@"RCFullKeyboard6" owner:self.view options:nil][0];
        [self.backgroundView addSubview:self.fullKeyboard];

        [self.fullKeyboard.nextBtn addTarget:self action:@selector(advanceToNextInputMode) forControlEvents:UIControlEventTouchUpInside];
        [self.fullKeyboard.numBtn addTarget:self action:@selector(goToNumKeyboard) forControlEvents:UIControlEventTouchUpInside];
        [self.fullKeyboard.symbolBtn addTarget:self action:@selector(goToSymbolKeyboard) forControlEvents:UIControlEventTouchUpInside];
        [self.fullKeyboard.languageBtn addTarget:self action:@selector(goToNineKeyboard) forControlEvents:UIControlEventTouchUpInside];
        [self.fullKeyboard.delBtn addTarget:self action:@selector(changeKeyboardWidth) forControlEvents:UIControlEventTouchUpInside];
    }

    self.fullKeyboard.hidden = NO;
    self.currentKeyboard = self.fullKeyboard;
    return _fullKeyboard;
}


- (NumKeyboard *)loadNumKeyboard {
    if (!_numKeyboard) {
        self.numKeyboard = [[NSBundle mainBundle] loadNibNamed:@"NumKeyboard" owner:self.view options:nil][0];
        [self.backgroundView addSubview:self.numKeyboard];

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
        [self.backgroundView addSubview:self.nineKeyboard];

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
        [self.backgroundView addSubview:self.symbolKeyboard];

        [self.symbolKeyboard.nextBtn addTarget:self action:@selector(advanceToNextInputMode) forControlEvents:UIControlEventTouchUpInside];
        [self.symbolKeyboard.languageBtn addTarget:self action:@selector(goToNineKeyboard) forControlEvents:UIControlEventTouchUpInside];
        [self.symbolKeyboard.numBtn addTarget:self action:@selector(goToNumKeyboard) forControlEvents:UIControlEventTouchUpInside];
    }
    self.symbolKeyboard.hidden = NO;
    self.currentKeyboard = self.symbolKeyboard;
    return _symbolKeyboard;
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


- (void)changeKeyboardWidth {
    self.singleHand = !self.singleHand;
    [self updateBackgroundView];
}

@end
