//
//  SHCToDoItem.m
//  Z-ClearStyle
//
//  Created by Zhengzhong Zhao on 1/26/13.
//  Copyright (c) 2013 Snowmanzzz. All rights reserved.
//

#import "SHCToDoItem.h"

@implementation SHCToDoItem

- (id)initWithText:(NSString *)text {
    if (self = [super init]) {
        self.text = text;
    }
    return self;
}

+ (id)toDoItemWithText:(NSString *)text {
    return [[SHCToDoItem alloc] initWithText:text];
}


@end
