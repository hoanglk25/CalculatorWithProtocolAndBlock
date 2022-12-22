//
//  CalculatorModel.h
//  Caculator
//
//  Created by Hoang Duc on 22/12/2022.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class CalculatorModel;

@protocol CalculatorModelDelegate <NSObject>

-(void)calculatorModel:(CalculatorModel *)viewModel onResult:(NSInteger)result;

@end

@interface CalculatorModel : NSObject
@property (nonatomic) NSInteger number1;
@property (nonatomic) NSInteger number2;
@property (nonatomic) NSInteger result;


@property (nonatomic) id<CalculatorModelDelegate> delegate;
-(void)adddOperator:(NSString *)op number:(NSInteger)num;
-(void)subOperator:(NSString *)op number:(NSInteger)num;
-(void)mulOperator:(NSString *)op number:(NSInteger)num;
-(void)divOperator:(NSString *)op number:(NSInteger)num;
-(void)clearOperator:(NSString *)op number:(NSInteger)num;



@end

NS_ASSUME_NONNULL_END
