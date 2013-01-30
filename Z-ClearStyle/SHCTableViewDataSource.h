//
//  SHCTableViewDataSource.h
//  Z-ClearStyle
//
//  Created by Zhengzhong Zhao on 1/29/13.
//  Copyright (c) 2013 Snowmanzzz. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SHCTableViewDataSource <NSObject>

- (NSInteger)numberOfRows;

- (UIView *)cellForRow:(NSInteger)row;

@end
