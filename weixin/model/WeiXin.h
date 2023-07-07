//
//  WeiXin.h
//  weixin
//
//  Created by chen on 2023/7/5.
//  Copyright © 2023 chen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeiXin : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *picture;
@property (nonatomic, copy) NSString *time;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)weixinWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
