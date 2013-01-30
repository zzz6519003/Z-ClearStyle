//
//  SHCTableView.m
//  Z-ClearStyle
//
//  Created by Zhengzhong Zhao on 1/29/13.
//  Copyright (c) 2013 Snowmanzzz. All rights reserved.
//

#import "SHCTableView.h"
#import "SHCTableViewCell.h"


@implementation SHCTableView {
    UIScrollView *_scrollView;
    // a set of that are reuseable
    NSMutableSet *_reuseCells;
    Class _cellClass;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self refreshView];
}

- (void)registerClassForCells:(Class)cellClass {
    _cellClass = cellClass;
}

- (UIView *)dequeueReuseableCell {
    UIView *cell = [_reuseCells anyObject];
    if (cell) {
        NSLog(@"Returning a cell from the pool");
        [_reuseCells removeObject:cell];
    }
    if (!cell) {
        NSLog(@"Creating a new cell");
        cell = [[_cellClass alloc] init];
    }
    return cell;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectNull];
        _scrollView.delegate = self;
        [self addSubview:_scrollView];
        _scrollView.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
        _reuseCells = [[NSMutableSet alloc] init];
    }
    return self;
}

- (void)layoutSubviews {
    _scrollView.frame = self.frame;
    [self refreshView];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

const float SHC_ROW_HEIGHT = 50.0f;

- (void)refreshView {
    //    _scrollView.contentSize = CGSizeMake(_scrollView.bounds.size.width, [_dataSource numberOfRows] * SHC_ROW_HEIGHT);
    //    for (int row = 0; row < [_dataSource numberOfRows]; row++) {
    //        UIView *cell = [_dataSource cellForRow:row];
    //        float topEdgeForRow = row * SHC_ROW_HEIGHT;
    //        CGRect frame = CGRectMake(0, topEdgeForRow, _scrollView.frame.size.width, SHC_ROW_HEIGHT);
    //        cell.frame = frame;
    //        [_scrollView addSubview:cell];
    //    }
    if (CGRectIsNull(_scrollView.frame)) {
        return;
    }
    _scrollView.contentSize = CGSizeMake(_scrollView.bounds.size.width, [_dataSource numberOfRows] * SHC_ROW_HEIGHT);
    for (UIView *cell in [self cellSubviews]) {
        if (cell.frame.origin.y + cell.frame.size.height < _scrollView.contentOffset.y) {
            [self recycleCell:cell];
        }
        if (cell.frame.origin.y > _scrollView.contentOffset.y + _scrollView.frame.size.height) {
            [self recycleCell:cell];
        }
    }
    
    
    // ensure you have a cell for each row
    
    int firstVisibleIndex = MAX(0, floor(_scrollView.contentOffset.y / SHC_ROW_HEIGHT));
    int lastVisibleIndex = MIN([_dataSource numberOfRows], firstVisibleIndex + 1 + ceil(_scrollView.frame.size.height / SHC_ROW_HEIGHT));
    
    
    for (int row = firstVisibleIndex; row < lastVisibleIndex; row++) {
        UIView *cell = [self cellForRow:row];
        if (!cell) {
            UIView *cell = [_dataSource cellForRow:row];
            float topEdgeForRow = row * SHC_ROW_HEIGHT;
            cell.frame = CGRectMake(0, topEdgeForRow, _scrollView.frame.size.width, SHC_ROW_HEIGHT);
            [_scrollView insertSubview:cell atIndex:0];
        }
    }
    
}

- (void)recycleCell:(UIView *)cell {
    [_reuseCells addObject:cell];
    [cell removeFromSuperview];
}

- (UIView *)cellForRow:(NSInteger)row {
    float topEdgeForRow = row * SHC_ROW_HEIGHT;
    for (UIView *cell in [self cellSubviews]) {
        if (cell.frame.origin.y == topEdgeForRow) {
            return cell;
        }
    }
    return nil;
}

- (NSArray *)cellSubviews {
    NSMutableArray *cells = [[NSMutableArray alloc] init];
    //The subViews property of a UIScrollView not only exposes the views that you have added to it yourself, but it also returns the two UIImageView instances that render the scroll indicators.
    for (UIView *subView in _scrollView.subviews) {
        if ([subView isKindOfClass:[SHCTableViewCell class]]) {
            [cells addObject:subView];
        }
    }
    return cells;
}

- (void)setDataSource:(id<SHCTableViewDataSource>)dataSource {
    _dataSource = dataSource;
    [self refreshView];
}

- (NSArray *)visibleCells {
    NSMutableArray *cells = [[NSMutableArray alloc] init];
    for (UIView *subView in [self cellSubviews]) {
        [cells addObject:subView];
    }
    NSArray *sortedCells = [cells sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        UIView *view1 = (UIView *)obj1;
        UIView *view2 = (UIView *)obj2;
        float result = view2.frame.origin.y - view1.frame.origin.y;
        if (result > 0.0) {
            return NSOrderedAscending;
        } else if (result < 0.0) {
            return NSOrderedDescending;
        } else {
            return NSOrderedSame;
        }
    }];
    return sortedCells;
}

- (void)reloadData {
    [[self cellSubviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self refreshView];
}

- (UIScrollView *)scrollView {
    return _scrollView;
}
@end
