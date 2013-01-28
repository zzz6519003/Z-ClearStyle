//
//  SHCTableViewCell.h
//  Z-ClearStyle
//
//  Created by Zhengzhong Zhao on 1/26/13.
//  Copyright (c) 2013 Snowmanzzz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHCToDoItem.h"
#import "SHCTableViewCellDelegate.h"

@interface SHCTableViewCell : UITableViewCell

@property (nonatomic) SHCToDoItem *todoItem;

#warning i say i like weak instead of assign
@property (weak, nonatomic) id<SHCTableViewCellDelegate> delegate;

@end
