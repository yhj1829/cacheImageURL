//
//  ViewController.m
//  Demo1
//
//  Created by 阳光 on 17/1/4.
//  Copyright © 2017年 阳光. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

static NSString *TableViewCellIdentifier=@"TableViewCellIdentifier";
@interface ViewController ()

@property(nonatomic,strong)NSMutableArray *dataArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _dataArr=[NSMutableArray array];

    [self initData];
}

-(void)initData
{
    NSData *jsonData=[NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"images.json" ofType:nil]];

    NSDictionary *jsonDic=[NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
    _dataArr=jsonDic[@"data"];

    [self.tableView registerClass:[TableViewCell class] forCellReuseIdentifier:TableViewCellIdentifier];
    self.tableView.showsVerticalScrollIndicator=NO;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    [cell.image sd_setImageWithURL:[NSURL URLWithString:self.dataArr[indexPath.row]] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        /**
         *  缓存image size
         */
        [XHWebImageAutoSize storeImageSize:image forURL:imageURL completed:^(BOOL result) {

         // reload size
            if (result) {
                [tableView xh_reloadRowAtIndexPath:indexPath forURL:imageURL];
            }
        }];
    }];

    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /**
     *  参数1:图片URL
     *  参数2:imageView 宽度
     *  参数3:预估高度,(此高度仅在图片尚未加载出来前起作用,不影响真实高度)
     */
    return [XHWebImageAutoSize imageHeightForURL:[NSURL URLWithString:self.dataArr[indexPath.row]] layoutWidth:[UIScreen mainScreen].bounds.size.width-20 estimateHeight:200];

}


@end
