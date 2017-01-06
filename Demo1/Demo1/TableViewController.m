//
//  TableViewController.m
//  Demo1
//
//  Created by 阳光 on 17/1/5.
//  Copyright © 2017年 阳光. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell1.h"
#import "FirstModel.h"



static NSString *TableViewCell1Identifier=@"TableViewCell1Identifier";
@interface TableViewController ()

@property(nonatomic,strong)NSMutableArray *dataArr;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _dataArr=[NSMutableArray array];

    [self initData];
}

-(void)initData
{
    NSData *jsonData=[NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"news.json" ofType:nil]];

    NSDictionary *jsonDic=[NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
    _dataArr=jsonDic[@"data"];
    _dataArr=[FirstModel mj_objectArrayWithKeyValuesArray:_dataArr];

    [self.tableView registerClass:[TableViewCell1 class] forCellReuseIdentifier:TableViewCell1Identifier];
    self.tableView.showsVerticalScrollIndicator=NO;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell1 *cell=[tableView dequeueReusableCellWithIdentifier:TableViewCell1Identifier];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
     FirstModel *firstModel=self.dataArr[indexPath.row];
    [cell.image sd_setImageWithURL:[NSURL URLWithString:firstModel.top_image] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
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
    FirstModel *firstModel=self.dataArr[indexPath.row];
    return [XHWebImageAutoSize imageHeightForURL:[NSURL URLWithString:firstModel.top_image] layoutWidth:[UIScreen mainScreen].bounds.size.width-20 estimateHeight:200]+100;
    
}




@end
