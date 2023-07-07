//
//  WeixinCell.m
//  weixin
//
//  Created by chen on 2023/7/5.
//  Copyright © 2023 chen. All rights reserved.
//

#import "WeixinCell.h"
#import "WeiXinFrame.h"
#import "WeiXin.h"

@interface WeixinCell()

//属性引用控件
@property (nonatomic, weak) UIImageView *icon;
@property (nonatomic, weak) UILabel *name;
@property (nonatomic, weak) UILabel *text;
@property (nonatomic, weak) UIButton *picture;
@property (nonatomic, weak) UILabel *time;

//点击图片查看大图功能
- (void)clickBig;

@end

@implementation WeixinCell

- (void)clickBig{
    
    NSLog(@"Method in view");
    //在回调代理方法时，首先判断自身的代理是否实现了代理方法，否则会导致崩溃
    //如果自身代理实现了代理方法，在该方法中回调代理实现的具体的代理方法
    if ( [self.delegate respondsToSelector:@selector(BtnClick:)] )
    {
        [self.delegate BtnClick:_picture];
    }
    else
    {
        NSLog(@"BtnClick: haven't found in delegate.");
    }
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if( self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        //手写控件
        UIImageView *icon = [[UIImageView alloc] init];
        [self.contentView addSubview:icon];
        self.icon = icon;
        
        UILabel *name = [[UILabel alloc] init];
        [self.contentView addSubview:name];
        self.name = name;
        self.name.font = [UIFont boldSystemFontOfSize:23];
        self.name.textColor = [UIColor colorWithRed: 0.36 green: 0.42 blue: 0.57 alpha: 1.00];
        
        //self.name.backgroundColor = [UIColor redColor];
        
        UILabel *text= [[UILabel alloc] init];
        [self.contentView addSubview:text];
        self.text = text;
        self.text.font = [UIFont systemFontOfSize:23];
        self.text.textColor = [UIColor colorWithRed: 0.00 green: 0.00 blue: 0.00 alpha: 1.00];
        self.text.numberOfLines = 0;
        //self.text.backgroundColor = [UIColor yellowColor];
        
        UIButton *picture = [[UIButton alloc] init];
        [self.contentView addSubview:picture];
        self.picture = picture;
        
        UILabel *time = [[UILabel alloc] init];
        [self.contentView addSubview:time];
        self.time = time;
        self.time.font = [UIFont systemFontOfSize:20];
        self.time.textColor = [UIColor colorWithRed: 0.45 green: 0.44 blue: 0.45 alpha: 1.00];
        
        [_picture addTarget:self.contentView.superview action:@selector(clickBig) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    
    NSLog(@"cell的init方法！！！");
    return self;
}

- (void)setModel:(WeiXinFrame*)model{
    _model = model;
    WeiXin * weixin = model.data;
    
    self.icon.image = [UIImage imageNamed:weixin.icon];
    self.icon.frame = model.iconFrame;
    
    self.name.text = weixin.name;
    self.name.frame = model.nameFrame;
    
    if(weixin.text){
        self.text.text = weixin.text;
        self.text.frame = model.textFrame;
        self.text.hidden = NO;
    }else{
        self.text.hidden = YES;
    }
    
    
    if(weixin.picture){
        //self.picture.imageView.image = [UIImage imageNamed:weixin.picture];
        [self.picture setImage:[UIImage imageNamed:weixin.picture] forState:UIControlStateNormal];
        self.picture.frame = model.pictureFrame;
        self.picture.hidden = NO;
    }else{
        self.picture.hidden = YES;
    }
    
    
    self.time.text = weixin.time;
    self.time.frame = model.timeFrame;
    
    NSLog(@"cell的set方法！！！");
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
