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
        if (res >= 10) {
            jinw = 1;
        }
        [resString insertString:[NSString stringWithFormat:@"%d",res%10] atIndex:0];
        
    }
    if (jinw!= 0) {
        [resString insertString:@"1" atIndex:0];
    }
    return [resString copy];
    
    
    
    
}

// C 版大数据相加算法

char *sumWithNumStr1AndStr2(char *num1,char *num2)
{
    int  num1Lenght = (int )strlen(num1);
    int  num2Length = (int )strlen(num2);
    int minLength = num1Lenght > num2Length ? num2Length :num1Lenght;
    int maxLength = num1Lenght > num2Length ? num1Lenght :num2Length;
    int space = maxLength - minLength;
    
    char *maxNum = num1Lenght > num2Length ? num1 : num2;
    char *minNum = num2Length > num1Lenght ? num1 : num2;
    
    
    char *resNum = new char[maxLength+1];
    int jinw = 0;
    
    for (int i = maxLength-1 ; i >= 0 ; i--  ) {
        char tempL = maxNum[i];
        char tempS = '0';
        int shotIndex = i - space;
        if (shotIndex >= 0) {
            tempS = minNum[shotIndex];
        }
        int res = (tempL-48) + (tempS-48) + jinw;
        jinw = 0;
        if (res >= 10) {
            jinw = 1;
        }
        resNum[i+1] = (char)((res %10)+48);
        
    }
    if (jinw != 0) {
        resNum[0] = (char)(1+48);
    }else{
        resNum[0] = (char)(48);
    }
    return resNum;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        for (char a = '0'; a <= '9' ; a++) {
            printf("%d = %c\n",a,a);
        }
        printf("%s\n",sumWithNumStr1AndStr2("999", "1"));        NSLog(@"%@",sumWithStringAAndStringB(@"999", @"1"));
        NSLog(@"Hello, World!");
    }
    return 0;
}
