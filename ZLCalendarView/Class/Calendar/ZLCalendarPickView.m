//
//  ZLCalendarPickView.m
//  EOT
//
//  Created by LayZhang on 2018/8/13.
//  Copyright © 2018年 Zhanglei. All rights reserved.
//

#import "ZLCalendarPickView.h"
#import "ZLCalendarCell.h"
#import "ZLCalendarUtils.h"

@interface ZLCalendarPickView()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *daysOfMonth;

@end

@implementation ZLCalendarPickView

- (void)initComponent {
    self.backgroundColor = ZLWhiteColor;
    [self addSubview:self.collectionView];
    [self registCell];
}

- (void)registCell {
    [self.collectionView registerClass:[BaseCollectionCell class]
            forCellWithReuseIdentifier:NSStringFromClass([BaseCollectionCell class])];
    [self.collectionView registerClass:[ZLCalendarCell class]
            forCellWithReuseIdentifier:NSStringFromClass([ZLCalendarCell class])];
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.scrollEnabled = NO;
    }
    return _collectionView;
}

- (void)reloadData {
    if (self.collectionView) {
        [self.collectionView reloadData];
    }
}

- (void)setCurCalendarModel:(ZLCalendarModel *)curCalendarModel {
    if (!curCalendarModel) {
        return;
    }
    _curCalendarModel = curCalendarModel;
    self.daysOfMonth = [ZLCalendarUtils getTotalDaysInCalendar:self.curCalendarModel];
    [self reloadData];
}

#pragma mark - collectionView delegate
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewFlowLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat cellMargin = (collectionView.width - 18 * SCALE) / 7;
    CGFloat itemHeight = self.height / (self.daysOfMonth.count / 7);
    return CGSizeMake(cellMargin, itemHeight);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

#pragma mark - DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.daysOfMonth.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ZLCalendarCell *cell = [ZLCalendarCell dequeueCellForCollection:collectionView
                                                       forIndexPath:indexPath];

    ZLCalendarModel *model = self.daysOfMonth[indexPath.row];
    model.isCellSelected = [model isEquealToCalendarModel:self.curCalendarModel];
    cell.cellData = model;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    ZLCalendarModel *model = self.daysOfMonth[indexPath.row];
    if (model.canOperate) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(pickView:didSelectedDate:)]) {
            [self.delegate pickView:self didSelectedDate:model];
        }
    }
}




@end
