//
//  KSYCommentTableView.m
//  KSYVideoDemo
//
//  Created by 崔崔 on 15/12/8.
//  Copyright © 2015年 kingsoft. All rights reserved.
//

#import "KSYCommentTableView.h"
#import "KSYCommentCell.h"
#import "CommentModel.h"
@interface KSYCommentTableView ()
{
    NSMutableArray *_colorArr;
    UITableView     *_tableView;
}
@end

@implementation KSYCommentTableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _colorArr = [[NSMutableArray alloc] initWithCapacity:0];
        for (int i = 0; i < 7; i++) {
            [_colorArr addObject:@""];
        }
        self.backgroundColor = [UIColor clearColor];
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorColor = [UIColor clearColor];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.scrollEnabled = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];

        [self addSubview:_tableView];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _colorArr = [[NSMutableArray alloc] initWithCapacity:0];
        for (int i = 0; i < 7; i++) {
            [_colorArr addObject:@""];
        }
        self.backgroundColor = [UIColor clearColor];
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, self.frame.size.width, self.frame.size.height)];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorColor = [UIColor clearColor];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        
        [self addSubview:_tableView];
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _colorArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifer = @"identifer";
    KSYCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        cell = [[KSYCommentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    
    cell.userModel = [_colorArr objectAtIndex:indexPath.row];

    return cell;
}

- (void)newUserAdd:(id)object
{
    
    //一个cell刷新
    [_colorArr addObject:object];


    [_tableView reloadData];
    [_tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:_colorArr.count-1 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    [self delleteObj:object];
}

- (void)delleteObj:(id)object
{

    [self performSelector:@selector(test:) withObject:object afterDelay:4];
}

- (void)test:(CommentModel *)obj
{
//    obj.isShoudDele = YES;
    NSInteger i = [_colorArr indexOfObject:obj];
    [_colorArr removeObject:obj];
    [_colorArr insertObject:@"" atIndex:i];
    [_tableView reloadData];
    [_tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:_colorArr.count-1 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];

}
@end
