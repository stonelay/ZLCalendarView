//
//  MainViewCell.m
//  LayZhangDemo
//
//  Created by LayZhang on 2017/5/9.
//  Copyright © 2017年 Zhanglei. All rights reserved.
//

#import "MainViewCell.h"
#import "UIImage+ZLEX.h"
#import "ZLPreMacro.h"

@implementation MainViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"SDEleSignatureCell";
    
    MainViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[MainViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageWithBgColor:[UIColor whiteColor]]];
        cell.textLabel.textColor = ZLGray(39);
        cell.textLabel.font = ZLNormalFont(15);
    }
    return cell;
}

#pragma mark - 设置数据
- (void)setItem:(NSDictionary *)item {
    self.textLabel.text = item[@"title"];
}

@end
