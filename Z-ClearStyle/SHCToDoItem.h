//
//  SHCToDoItem.h
//  Z-ClearStyle
//
//  Created by Zhengzhong Zhao on 1/26/13.
//  Copyright (c) 2013 Snowmanzzz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHCToDoItem : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic) BOOL completed;

- (id)initWithText:(NSString *)text;

+ (id)toDoItemWithText:(NSString *)text;

@end
