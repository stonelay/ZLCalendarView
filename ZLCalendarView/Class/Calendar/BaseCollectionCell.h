//
//  BaseCollectionCell.h
//  ZLCalendarView
//
//  Created by LayZhang on 2018/8/14.
//  Copyright © 2018年 Zhanglei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCollectionCell : UICollectionViewCell

@property (nonatomic, strong) id cellData;

+ (NSString *)cellIdentifier;
+ (NSNumber *)heightForCell:(id)cellData;
+ (NSNumber *)widthForCell:(id)cellData;
+ (instancetype)dequeueCellForCollection:(UICollectionView *)collectionView
                            forIndexPath:(NSIndexPath *)indexPath;
- (void)reloadData;

- (void)cellAddSubview:(UIView *)view;

@end
