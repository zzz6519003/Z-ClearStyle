//
//  SHCTableViewCellDelegate.h
//  Z-ClearStyle
//
//  Created by Zhengzhong Zhao on 1/27/13.
//  Copyright (c) 2013 Snowmanzzz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SHCToDoItem.h"

@protocol SHCTableViewCellDelegate <NSObject>

- (void)toDoItemDeleted:(SHCToDoItem *)todoItem;

- (void)toDoItemComplete:(SHCToDoItem *)todoItem;

@end
