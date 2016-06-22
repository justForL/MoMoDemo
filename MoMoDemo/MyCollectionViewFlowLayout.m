//
//  MyCollectionViewFlowLayout.m
//  MoMoDemo
//
//  Created by James on 16/6/22.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "MyCollectionViewFlowLayout.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

#define kScaleW [UIScreen mainScreen].bounds.size.width / 375.0;
#define kScaleH [UIScreen mainScreen].bounds.size.height / 667.0
@implementation MyCollectionViewFlowLayout
-(void)prepareLayout {
    [super prepareLayout];
    self.itemSize = CGSizeMake(kScreenW, kScreenH - 64);
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
}
@end
