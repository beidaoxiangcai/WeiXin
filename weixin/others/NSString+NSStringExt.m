//
//  NSString+NSStringExt.m
//  weixin
//
//  Created by chen on 2023/7/6.
//  Copyright © 2023 chen. All rights reserved.
//

#import "NSString+NSStringExt.h"

//#import <AppKit/AppKit.h>


@implementation NSString (NSStringExt)

- (CGSize) sizeOfText:(CGSize)maxSize font:(UIFont*)font{
    NSDictionary *attrs = @{NSFontAttributeName:font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}
+ (CGSize) sizeWithText:(NSString *)text maxSize:(CGSize)maxSize font:(UIFont*)font{
    return [text sizeOfText:maxSize font:font];
}

@end
