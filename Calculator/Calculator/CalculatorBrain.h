//
//  CalculatorBrain.h
//  Calculator
//
//  Created by John McGovern on 8/6/12.
//  Copyright (c) 2012 John McGovern. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

-(void) pushOperand:(double)operand;
-(double) performOperation:(NSString *) operation;

@end
