//
//  TitleView.m
//  MoMoDemo
//
//  Created by James on 16/6/21.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "TitleView.h"

@interface TitleView ()
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) UIView *moveView;

@end
@implementation TitleView

- (instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray {
    if (self = [super initWithFrame:frame]) {
//        self.backgroundColor = [UIColor whiteColor];
        self.titleArray = titleArray;
        CGFloat labelWidth =self.bounds.size.width / titleArray.count;
        CGFloat labelHight = self.bounds.size.height;
        for (int i = 0; i < titleArray.count; ++i) {
            UILabel *label = [[UILabel alloc]init];
            label.textAlignment = NSTextAlignmentCenter;
            label.text = titleArray[i];
            label.tag = i;
            label.frame = CGRectMake(labelWidth * i, 0, labelWidth, labelHight);
            [self addSubview:label];
            label.userInteractionEnabled = YES;
            UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapLabelAction:)];
            [label addGestureRecognizer:tap];
        }
        UILabel *label = (UILabel *)self.subviews[0];
        UIView *moveView = [[UIView alloc]init];
        moveView.bounds = CGRectMake(0, 0, labelWidth * 0.5, 2);
        moveView.center = CGPointMake(label.center.x, self.bounds.size.height-2);
        moveView.backgroundColor = [UIColor blueColor];
        self.moveView = moveView;
        [self addSubview:moveView];
        
        
    }
    return self;
}

- (void)tapLabelAction:(UITapGestureRecognizer *)recognizer {
    UILabel *label = (UILabel *)recognizer.view;
    [UIView animateWithDuration:0.25 animations:^{
        self.moveView.center = CGPointMake(label.center.x, self.bounds.size.height-2);
    }];
    if ([self.delegate respondsToSelector:@selector(titleView:index:)]) {
        [self.delegate titleView:self index:label.tag];
    }
}
- (void)setOffset:(CGFloat)offset {
    _offset = offset;
    NSNumber *number = [NSNumber numberWithFloat:offset];
    UILabel *label = self.subviews[[number integerValue]];
    [UIView animateWithDuration:0.25 animations:^{
        self.moveView.center = CGPointMake(label.center.x, self.bounds.size.height-2);
    }];

    
    
//    
    NSLog(@"%f",offset);
}
+ (instancetype)creatTitleViewWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray {

    return [[self alloc] initWithFrame:frame titleArray:titleArray];
}
@end
