//
//  ViewController.m
//  Caculator
//
//  Created by Hoàng Đức on 18/12/2022.
//

#import "ViewController.h"
#import "CalculatorModel.h"

@interface ViewController () <CalculatorModelDelegate>

{
    NSString *text;
    NSString *operator;
    float value;
    BOOL isTyping;
}
@property (nonatomic) CalculatorModel *viewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _viewModel = [[CalculatorModel alloc]init];
    _viewModel.delegate = self;
    text = self.displayLabel.text;
    isTyping = NO;
    
}
- (void)calculatorModel:(CalculatorModel *)viewModel onResult:(NSInteger)result {
    NSLog(@"%ld",result);
    self.displayLabel.text = [NSString stringWithFormat:@"%ld", result];
}


- (IBAction)clear:(UIButton*)sender {
    text = @"0";
//    value = 0;
    isTyping = NO;
    [self clearOperator:@"C"];
    self.displayLabel.text = text;

}


- (IBAction)equal:(UIButton*)sender {
    if ([operator isEqualToString: @"+"]) {
        [self addOperator:@"="];
    }
    if ([operator isEqualToString: @"-"]) {
        [self subOperator:@"="];
    }
    if ([operator isEqualToString: @"*"]) {
        [self mulOperator:@"="];
    }
    if ([operator isEqualToString: @"/"]) {
        [self divOperator:@"="];
    }
    operator = nil;
    isTyping = NO;

}

- (IBAction)operation:(UIButton*)sender {
    if (!operator) {
            operator = sender.titleLabel.text;
            isTyping = NO;
        }
        if (!value) {
            value = [text floatValue];
        }
    if ([operator isEqualToString:@"+"]) {
        [self addOperator:@"+"];
    }
    if ([operator isEqualToString:@"-"]) {
        [self subOperator:@"-"];
    }
    if ([operator isEqualToString:@"*"]) {
        [self mulOperator:@"*"];
    }
    if ([operator isEqualToString:@"/"]) {
        [self divOperator:@"/"];
    }

}

- (IBAction)numbers:(UIButton*)sender {
    if (!isTyping) {
        text = @"";
        isTyping = YES;
    }
    text = [text stringByAppendingString: sender.titleLabel.text];
    self.displayLabel.text = text;
}

-(void)addOperator:(NSString *)op {
    if ([self.displayLabel.text  isEqualToString:@""]) {
        return;
    }
    NSString *text = self.displayLabel.text;
    [self.viewModel adddOperator:op number:text.longLongValue];
}
-(void)subOperator:(NSString *)op {
    if ([self.displayLabel.text  isEqualToString:@""]) {
        return;
    }
    NSString *text = self.displayLabel.text;
    [self.viewModel subOperator:op number:text.longLongValue];
}
-(void)mulOperator:(NSString *)op {
    if ([self.displayLabel.text  isEqualToString:@""]) {
        return;
    }
    NSString *text = self.displayLabel.text;
    [self.viewModel mulOperator:op number:text.longLongValue];
}
-(void)divOperator:(NSString *)op {
    if ([self.displayLabel.text  isEqualToString:@""]) {
        return;
    }
    NSString *text = self.displayLabel.text;
    [self.viewModel divOperator:op number:text.longLongValue];
}
-(void)clearOperator:(NSString *)op {
    if ([self.displayLabel.text  isEqualToString:@""]) {
        return;
    }
    NSInteger number = 0;
    [self.viewModel clearOperator:op number: number];
}

@end
