//
//  Define.h
//  NonConstraint-demo
//
//  Created by luowei on 15/1/29.
//  Copyright (c) 2015年 luowei. All rights reserved.
//

#ifndef NonConstraint_demo_Define_h
#define NonConstraint_demo_Define_h


#ifdef DEBUG
#define Log(format, ...) NSLog(format, ## __VA_ARGS__)
#else
    #define Log(format, ...)
#endif



#define SINGLEHAND_WIDTH 320
#define INPUT_LANDSCAPE_HEIGHT 120
#define INPUT_HEIGHT 160

#endif
