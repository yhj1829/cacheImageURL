//
//  TableViewCell.m
//  Demo1
//
//  Created by 阳光 on 17/1/4.
//  Copyright © 2017年 阳光. All rights reserved.
//

#import "TableViewCell.h"
#import <Masonry.h>

@implementation TableViewCell

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


@end
