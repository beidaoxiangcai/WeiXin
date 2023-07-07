//
//  WeiXinFrame.m
//  weixin
//
//  Created by chen on 2023/7/5.
//  Copyright © 2023 chen. All rights reserved.
//

#import "WeiXinFrame.h"
#import <UIKit/UIKit.h>
#import "NSString+NSStringExt.h"

@implementation WeiXinFrame

- (void)setData:(WeiXin *)data{
    _data = data;
    
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width; //获取主屏幕的宽度
    
    CGFloat iconX = 20;
    CGFloat iconY = 10;
    CGFloat iconW = 60;
    _iconFrame = CGRectMake(iconX, iconY, iconW, iconW);
    
    //昵称frame
    CGFloat nameX = iconW + iconX + 10;
    CGFloat nameY = iconY;
    CGSize nameSize = [data.name sizeOfText:CGSizeMake(MAXFLOAT, MAXFLOAT) font:textFont1];
    _nameFrame = CGRectMake(nameX, nameY, nameSize.width, nameSize.height);
    
    //正文frame
    CGFloat textX = nameX;
    CGFloat textY = nameY + nameSize.height;
    CGFloat width = screenW - CGRectGetMaxY(_iconFrame) - 20;
    CGSize textSize = [data.text sizeOfText:CGSizeMake(width, MAXFLOAT) font:textFont1];
    _textFrame = CGRectMake(textX, textY, textSize.width, textSize.height);
    
    //图片frame
    CGFloat pictureW = 200;
    CGFloat pictureH = 200;
    CGFloat pictureX = nameX;
    CGFloat pictureY;
    if(data.text){
        pictureY = textY + textSize.height + 10;
    }else{
        pictureY = textY + 10;
    }
    _pictureFrame = CGRectMake(pictureX, pictureY, pictureW, pictureH);
    
    //timeFrame
    CGFloat timeX = nameX;
    CGFloat timeY;
    CGSize timeSize = [data.time sizeOfText:CGSizeMake(200, MAXFLOAT) font:textFont2];
    if(data.picture){
        timeY = pictureH + pictureY + 10;
    }else{
        timeY = pictureY;
    }
    _timeFrame =CGRectMake(timeX, timeY, timeSize.width, timeSize.height);
    
    //行高
    _rowHeight = timeY + timeSize.height + 10;
    
    NSLog(@"weixinFrame的set方法！！！");
}

@end
