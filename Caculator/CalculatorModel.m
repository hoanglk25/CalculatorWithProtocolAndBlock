//
//  CalculatorModel.m
//  Caculator
//
//  Created by Hoang Duc on 22/12/2022.
//

#import "CalculatorModel.h"

@implementation CalculatorModel
@synthesize  number1, number2;

- (void)adddOperator:(NSString *)op number:(NSInteger)num {
    if ([op isEqualToString:@"+"]) {
        number1 = num;
    }
    if ([op isEqualToString:@"="]) {
        number2 = num;
        NSInteger res = number1 + number2;
        if (self.delegate && [self.delegate respondsToSelector:@selector(calculatorModel:onResult:)]) {
            [self.delegate calculatorModel:self onResult:res];
        }
    }
    
}
- (void)subOperator:(NSString *)op number:(NSInteger)num {
    if ([op isEqualToString:@"-"]) {
        number1 = num;
    }
    if ([op isEqualToString:@"="]) {
        number2 = num;
        NSInteger res = number1 - number2;
        if (self.delegate && [self.delegate respondsToSelector:@selector(calculatorModel:onResult:)]) {
            [self.delegate calculatorModel:self onResult:res];
        }
    }
}
- (void)mulOperator:(NSString *)op number:(NSInteger)num {
    if ([op isEqualToString:@"*"]) {
        number1 = num;
    }
    if ([op isEqualToString:@"="]) {
        number2 = num;
        NSInteger res = number1 * number2;
        if (self.delegate && [self.delegate respondsToSelector:@selector(calculatorModel:onResult:)]) {
            [self.delegate calculatorModel:self onResult:res];
        }
    }
    
}
- (void)divOperator:(NSString *)op number:(NSInteger)num {
    if ([op isEqualToString:@"/"]) {
        number1 = num;
    }
    if ([op isEqualToString:@"="]) {
        number2 = num;
        NSInteger res = number1 / number2;
        if (self.delegate && [self.delegate respondsToSelector:@selector(calculatorModel:onResult:)]) {
            [self.delegate calculatorModel:self onResult:res];
        }
    }
}
- (void)clearOperator:(NSString *)op number:(NSInteger)num {
    if ([op isEqualToString:@"C"]) {
        number1 = num;
        number2 = num;
        NSInteger res = number2;
        if (self.delegate && [self.delegate respondsToSelector:@selector(calculatorModel:onResult:)]) {
            [self.delegate calculatorModel:self onResult:res];
        }
    }
}

@end
