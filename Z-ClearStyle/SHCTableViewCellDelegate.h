//
//  SHCTableViewCellDelegate.h
//  Z-ClearStyle
//
//  Created by Zhengzhong Zhao on 1/27/13.
//  Copyright (c) 2013 Snowmanzzz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SHCToDoItem.h"

@class SHCTableViewCell;

@protocol SHCTableViewCellDelegate <NSObject>

- (void)cellDidBeginEditing:(SHCTableViewCell *)cell;

- (void)cellDidEndEditing:(SHCTableViewCell *)cell;

- (void)toDoItemDeleted:(SHCToDoItem *)todoItem;


@end
