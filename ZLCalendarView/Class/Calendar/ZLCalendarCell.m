//
//  ZLCalendarCell.m
//  EOT
//
//  Created by LayZhang on 2018/8/13.
//  Copyright © 2018年 Zhanglei. All rights reserved.
//

#import "ZLCalendarCell.h"
#import "ZLCalendarModel.h"

@interface ZLCalendarCell()

@property (nonatomic, strong) UILabel *dayTitle;
@property (nonatomic, strong) UIView *mSelectView;
@property (nonatomic, strong) UIView *pointView;
@property (nonatomic, assign) BOOL isToday;

@end

@implementation ZLCalendarCell

- (void)reloadData {
    if (self.cellData) {
        ZLCalendarModel *model = self.cellData;
        [self cellAddSubview:self.mSelectView];
        [self cellAddSubview:self.dayTitle];
        [self cellAddSubview:self.pointView];
        
        if (self.isToday) {
            self.dayTitle.text = @"今天";
            self.dayTitle.font = ZLBoldFont(12);
        } else {
            self.dayTitle.text = [NSString stringWithFormat:@"%ld", (long)model.day];
            self.dayTitle.font = ZLBoldFont(18);
        }
        [self.dayTitle sizeToFit];
        self.dayTitle.centerX = self.width / 2;
        
        if (model.canOperate) {
            if (model.isCellSelected) {
                self.mSelectView.backgroundColor = ZLRedColor;
                self.dayTitle.textColor = ZLWhiteColor;
            } else {
                self.mSelectView.backgroundColor = ZLClearColor;
                self.dayTitle.textColor = ZLGray(33);
            }
        } else {
            self.mSelectView.backgroundColor = ZLClearColor;
            self.dayTitle.textColor = ZLGray(222);
        }
        
        if (model.hasNoted) {
            self.pointView.backgroundColor = ZLRedColor;
        } else {
            self.pointView.backgroundColor = ZLGray(197);
        }
        
        
    }
}

- (BOOL)isToday {
    ZLCalendarModel *model = [ZLCalendarModel instanceWithDate:[NSDate new]];
    return [model isEquealToCalendarModel:self.cellData];
}

#pragma mark - property
- (UILabel *)dayTitle {
    if (!_dayTitle) {
        _dayTitle = [[UILabel alloc] init];
        _dayTitle.frame = self.bounds;
        _dayTitle.top = 5 * SCALE;
        _dayTitle.height = 20 * SCALE;
        _dayTitle.font = ZLBoldFont(18);
        _dayTitle.textAlignment = NSTextAlignmentCenter;
        _dayTitle.textColor = ZLGray(33);
    }
    return _dayTitle;
}

- (UIView *)mSelectView {
    if (!_mSelectView) {
        _mSelectView = [[UIView alloc] init];
        _mSelectView.size = CGSizeMake(35 * SCALE, 35 * SCALE);
        _mSelectView.centerX = self.width / 2;
        _mSelectView.backgroundColor = ZLRedColor;
        _mSelectView.layer.cornerRadius = 35 * SCALE / 2.0;
        _mSelectView.clipsToBounds = YES;
    }
    return _mSelectView;
}

- (UIView *)pointView {
    if (!_pointView) {
        _pointView = [[UIView alloc] init];
        _pointView.size = CGSizeMake(3 * SCALE, 3 * SCALE);
        _pointView.centerX = self.width / 2;
        _pointView.top = self.dayTitle.bottom + 2 * SCALE;
        _pointView.backgroundColor = ZLGray(197);
        _pointView.layer.cornerRadius = 3 * SCALE / 2.0;
        _pointView.clipsToBounds = YES;
    }
    return _pointView;
}


@end
