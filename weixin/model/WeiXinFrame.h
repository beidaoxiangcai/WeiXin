//
//  WeiXinFrame.h
//  weixin
//
//  Created by chen on 2023/7/5.
//  Copyright © 2023 chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import "WeiXin.h"
#define textFont1 [UIFont boldSystemFontOfSize:23]
#define textFont2 [UIFont systemFontOfSize:20]

NS_ASSUME_NONNULL_BEGIN

@interface WeiXinFrame : NSObject
@property (nonatomic, strong) WeiXin *data; //数据
@property (nonatomic, assign, readonly) CGRect iconFrame;
@property (nonatomic, assign, readonly) CGRect nameFrame;
@property (nonatomic, assign, readonly) CGRect textFrame;
@property (nonatomic, assign, readonly) CGRect pictureFrame;
@property (nonatomic, assign, readonly) CGRect timeFrame;
@property (nonatomic, assign, readonly) CGFloat rowHeight; //行高
@end

NS_ASSUME_NONNULL_END
