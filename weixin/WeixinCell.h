//
//  WeixinCell.h
//  weixin
//
//  Created by chen on 2023/7/5.
//  Copyright © 2023 chen. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WeiXinFrame;

NS_ASSUME_NONNULL_BEGIN

//自定义的按钮协议，该协议实现了<NSObject>协议，协议的名称自定
@protocol MyBtnDelegate <NSObject>

//协议中的方法，遵循该协议的类提供其具体的实现，协议有@optional和@required两个修饰符，默认情况下是@required
- (void) BtnClick:(UIButton *)btn;
@end

@interface WeixinCell : UITableViewCell

@property(nonatomic, strong)WeiXinFrame *model;
@property (nonatomic, weak) id <MyBtnDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
