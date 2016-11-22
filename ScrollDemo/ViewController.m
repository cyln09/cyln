//
//  ViewController.m
//  ScrollDemo
//
//  Created by cyln on 2016/11/17.
//  Copyright © 2016年 cyln. All rights reserved.
//

#import "ViewController.h"
#import "TestModel.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,assign) CGFloat lastOffY;
@property (nonatomic,assign) CGFloat lastDown;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *table = [[UITableView alloc] initWithFrame:self.view.bounds];
    table.dataSource = self;
    table.delegate = self;
    table.tableFooterView = [UIView new];
    [self.view addSubview:table];
    TestModel *model = [[TestModel alloc] init];
    TestModel *modelCopy = [model copy];
    TestModel *model1 = modelCopy;
    modelCopy.name = @"哈哈";
    [super viewDidLoad];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"=================1");
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"=================2"); });
        NSLog(@"=================3"); });
    // Do any additional setup after loading the view, typically from a nib.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.textLabel.text = @"hello";
    }
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y > self.lastOffY) {
        ///向上滑
    }else{
//        static  CGFloat lastDown;
//        NSLog(@"向下滑动%f",fabs(scrollView.contentOffset.y - _lastDown));
        if (fabs(scrollView.contentOffset.y - _lastDown)  >= 44) {
            _lastDown = scrollView.contentOffset.y;
            NSLog(@"向下滑动了44");
        }
    }
    self.lastOffY = scrollView.contentOffset.y;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
