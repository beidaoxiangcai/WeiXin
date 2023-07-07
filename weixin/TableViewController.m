//
//  TableViewController.m
//  weixin
//
//  Created by chen on 2023/7/5.
//  Copyright © 2023 chen. All rights reserved.
//

#import "TableViewController.h"
#import "WeiXin.h"
#import "WeiXinFrame.h"
#import "WeixinCell.h"

@interface TableViewController () <UITableViewDataSource, UITableViewDelegate,MyBtnDelegate>

@property (nonatomic, strong) NSMutableArray *weixinFrame;
@property (nonatomic, weak) UIButton *btncover;
@property (nonatomic, assign) CGRect picFrame;
@property (nonatomic, weak) UIButton *picture;

@end

@implementation TableViewController

- (void)BtnClick:(UIButton *)_picture{
    if(self.btncover){
        [self smallImage];
    }else{
        [self bigImage:_picture];
    }
}

- (void)bigImage:(UIButton *)_picture{
    UIButton *tmpPic= [_picture snapshotViewAfterScreenUpdates:NO];

    tmpPic.frame = _picture.frame;
    _picture = tmpPic;
    
    //记录原始frame
   _picFrame = _picture.frame;
   self.picture = _picture;
   
   //创建一个全屏的黑底
   UIButton * btncover = [[UIButton alloc] init];
   [self.tableView addSubview:btncover];
   
   btncover.frame = CGRectMake(0, 0, 414, 896-28);
   btncover.backgroundColor = [UIColor blackColor];
   
   //把图片放到黑底上面
   [self.tableView addSubview:_picture];
   [self.tableView bringSubviewToFront:_picture];
   
   //图片放大
   CGRect picFrame = _picture.frame;
   CGFloat multiple = btncover.frame.size.width / picFrame.size.width;
   _picture.transform = CGAffineTransformMakeScale(multiple, multiple);
   //_picture.center = btncover.center;
   _picture.transform = CGAffineTransformTranslate(self.tableView.transform, 0, 200);
    
   self.btncover = btncover;
   [btncover addTarget:self action:@selector(smallImage) forControlEvents:UIControlEventTouchUpInside];
   [_picture addTarget:self action:@selector(smallImage) forControlEvents:UIControlEventTouchUpInside];
}

-(void)smallImage{
    //图片还原
    self.picture.frame = self.picFrame;
    [self.picture removeFromSuperview];
    //移除阴影
    [self.btncover removeFromSuperview];
    self.btncover = nil;
    //[self.picture removeFromSuperview];
}





#pragma mark - 懒加载
- (NSMutableArray*) weixinFrame{
    if (_weixinFrame == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"weixin.plist" ofType:nil];
        NSDictionary *arrayDict = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayModels = [NSMutableArray array];
        for(NSDictionary *dic in arrayDict){
            WeiXin *model = [WeiXin weixinWithDict:dic];
            WeiXinFrame *weixinFrame = [[WeiXinFrame alloc] init];
            weixinFrame.data = model;//已获得数据和frame
            [arrayModels addObject:weixinFrame];
        }
        _weixinFrame = arrayModels;
    }
    NSLog(@"懒加载！！！");
    return _weixinFrame;
}

- (void)viewDidLoad {
    [super viewDidLoad];
     NSLog(@"view did load！！！");
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    NSLog(@"组数！！！");
    return 1;
}

//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    NSLog(@"行数！！！%d", _weixinFrame.count);
    return self.weixinFrame.count;
}

//每行内容
- (WeixinCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 获取数据
    WeiXinFrame *model = _weixinFrame[indexPath.row];
    
    //创建cell
    //声明重用ID
    static NSString *ID = @"weixin_cell";
    //去缓冲池找相应的cell
    WeixinCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    //若没有可用的，就重新创建
    if(cell == nil){
        cell = [[WeixinCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    //设置cell
    cell.model = model;
    cell.delegate = self;
    
    NSLog(@"行内容！！！");
    return cell;
}


#pragma mark -  计算行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    WeiXinFrame *weixinFrame = self.weixinFrame[indexPath.row];
    return weixinFrame.rowHeight;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
