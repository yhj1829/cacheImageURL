//
//  TableViewCell1.m
//  Demo1
//
//  Created by 阳光 on 17/1/5.
//  Copyright © 2017年 阳光. All rights reserved.
//

#import "TableViewCell1.h"

#import <Masonry.h>

@implementation TableViewCell1

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        self.image.image=[UIImage imageNamed:@"logo"];
        _image.hidden=NO;

    }
    return self;
}

-(UIImageView *)image
{
    if (!_image) {
        _image=[UIImageView new];
        [self.contentView addSubview:_image];
        _image.backgroundColor=[UIColor lightGrayColor];
        [_image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_offset(10);
            make.bottom.right.mas_offset(-10);
        }];
    }
    return _image;
}

//-(UILabel *)titleLabel1
//{
//    if (!_titleLabel1) {
////        _titleLabel=[self.contentView getLabelWithText:@"文字" font:[UIFont systemFontOfSize:12] textColor:[UIColor yellowColor] textAlignment:NSTextAlignmentCenter lineBreakMode:NSLineBreakByTruncatingTail numberOfLines:1];
//        _titleLabel1=[UILabel new];
//
//        [self.contentView addSubview:_titleLabel1];
//        [_titleLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_offset(kmargin);
//            make.right.mas_offset(-kmargin);
//            make.top.mas_offset(self.image.mas_bottom).offset(kmargin);
//        }];
//    }
//    return _titleLabel1;
//}


@end
