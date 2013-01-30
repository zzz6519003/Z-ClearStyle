//
//  SHCTableView.h
//  Z-ClearStyle
//
//  Created by Zhengzhong Zhao on 1/29/13.
//  Copyright (c) 2013 Snowmanzzz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHCTableViewCell.h"
#import "SHCTableViewDataSource.h"

@interface SHCTableView : UIView <UIScrollViewDelegate>

@property (nonatomic, assign) id<SHCTableViewDataSource> dataSource;
@property (nonatomic, assign, readonly) UIScrollView *scrollView;

- (UIView *)dequeueReuseableCell;

- (void)registerClassForCells:(Class)cellClass;

- (NSArray *)visibleCells;

- (void)reloadData;

@end
