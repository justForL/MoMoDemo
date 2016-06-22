//
//  TitleView.h
//  MoMoDemo
//
//  Created by James on 16/6/21.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TitleView;
@protocol TitleViewDelegate <NSObject>

- (void)titleView:(TitleView *)titleView index:(NSInteger)index;

@end
@interface TitleView : UIView
@property (nonatomic, assign) CGFloat offset;
@property (nonatomic, assign) id<TitleViewDelegate> delegate;
+ (instancetype)creatTitleViewWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray;
@end
