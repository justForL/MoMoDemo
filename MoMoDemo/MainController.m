//
//  MainController.m
//  MoMoDemo
//
//  Created by James on 16/6/21.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "MainController.h"
#import "TitleView.h"
#import "MyCollectionViewFlowLayout.h"
@interface MainController ()<UICollectionViewDelegate,UICollectionViewDataSource,TitleViewDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) TitleView *titleView;


@end
static NSString *ID = @"collectionViewId";
@implementation MainController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
}

- (void)setUpUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
    TitleView *titleView = [TitleView creatTitleViewWithFrame:CGRectMake(0, 20, 250, 44) titleArray:@[@"动态",@"人",@"群组"]];
    titleView.delegate = self;
    self.titleView = titleView;
    
    self.navigationItem.titleView = titleView;
    [self.view addSubview:self.collectionView];
    
}

- (void)titleView:(TitleView *)titleView index:(NSInteger)index {
    [self.collectionView selectItemAtIndexPath:[NSIndexPath indexPathWithIndex:index] animated:YES scrollPosition:UICollectionViewScrollPositionNone];
}

#pragma mark - scrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.titleView.offset = scrollView.contentOffset.x / [UIScreen mainScreen].bounds.size.width;
}
#pragma mark - collectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UICollectionViewCell alloc]init];

    }
    cell.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    return cell;
    
}
#pragma mark - lazy Load
- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:[MyCollectionViewFlowLayout new]];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
        _collectionView.pagingEnabled = YES;
        _collectionView.bounces = NO;
    }
    return _collectionView;
}
@end
