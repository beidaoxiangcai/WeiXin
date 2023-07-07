//
//  NSString+NSStringExt.h
//  weixin
//
//  Created by chen on 2023/7/6.
//  Copyright © 2023 chen. All rights reserved.
//

//#import <AppKit/AppKit.h>


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (NSStringExt)

- (CGSize) sizeOfText:(CGSize)maxSize font:(UIFont*)font;
+ (CGSize) sizeWithText:(NSString *)text maxSize:(CGSize)maxSize font:(UIFont*)font;

@end

NS_ASSUME_NONNULL_END
