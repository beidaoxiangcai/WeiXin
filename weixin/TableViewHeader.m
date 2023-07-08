//
//  TableViewHeader.m
//  weixin
//
//  Created by chen on 2023/7/7.
//  Copyright © 2023 chen. All rights reserved.
//

#import "TableViewHeader.h"

@interface TableViewHeader ()



@end

@implementation TableViewHeader

+ (instancetype)HeaderView{
    TableViewHeader *header = [[[NSBundle mainBundle] loadNibNamed:@"TableViewHeader" owner:nil options:nil] firstObject];
    return header;
}

@end
