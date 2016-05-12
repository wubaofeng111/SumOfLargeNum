//
//  main.m
//  SumOfLargeNum
//
//  Created by friday on 16/5/12.
//  Copyright (c) 2016年 friday. All rights reserved.
//

#import <Foundation/Foundation.h>

// OC 版大数据相加算法。

NSString *sumWithStringAAndStringB(NSString* numA,NSString *numB)
{
    NSMutableString *resString = [NSMutableString string];
    
    NSInteger minLength = numA.length > numB.length ? numB.length :numA.length;
    NSInteger maxLength = numA.length > numB.length ? numA.length : numB.length;
    NSString *longString = numA.length > numB.length ? numA : numB;
    NSString *shortString = numA.length > numB.length ? numB : numA;
    NSInteger jinw = 0;

    
    NSInteger space = maxLength - minLength;
    
    for (NSInteger i = maxLength -1; i >= 0 ; i-- ) {
        NSInteger shotIndex = i-space;
        NSString *tempL = [longString substringWithRange:NSMakeRange(i, 1)];
        NSString *tempS = nil;
        
        if (shotIndex >= 0) {
            tempS =  [shortString substringWithRange:NSMakeRange(shotIndex, 1)];
        }
        NSInteger res = tempL.integerValue + tempS.integerValue + jinw;
        jinw = 0;
        if (res > 10) {
            jinw = 1;
        }
        [resString insertString:[NSString stringWithFormat:@"%d",res] atIndex:0];
        
    }
    return [resString copy];
    
    
    
    
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
