//
//  ZLCalendarView.m
//  EOT
//
//  Created by LayZhang on 2018/8/13.
//  Copyright © 2018年 Zhanglei. All rights reserved.
//

#import "ZLCalendarView.h"

#import "ZLCalendarHeadView.h"
#import "ZLCalendarPickView.h"

@interface ZLCalendarView()<ZLCalendarHeadViewDelegate, ZLCalendarPickViewDelegate>

@property (nonatomic, strong) ZLCalendarHeadView *headView;
@property (nonatomic, strong) ZLCalendarPickView *pickView;

@end

@implementation ZLCalendarView

- (void)initComponent {
    [self addSubview:self.headView];
    [self addSubview:self.pickView];
}

- (ZLCalendarHeadView *)headView {
    if (!_headView) {
        _headView = [[ZLCalendarHeadView alloc] initWithFrame:CGRectMake(0, 0, self.width, 60 * SCALE)];
        _headView.delegate = self;
    }
    return _headView;
}

- (ZLCalendarPickView *)pickView {
    if (!_pickView) {
        _pickView = [[ZLCalendarPickView alloc] initWithFrame:CGRectMake(0, self.headView.bottom, self.width, self.height - self.headView.height)];
        _pickView.delegate = self;
    }
    return _pickView;
}

- (void)setCurCalendarModel:(ZLCalendarModel *)curCalendarModel {
    if (!curCalendarModel) {
        return;
    }
    _curCalendarModel = curCalendarModel;
    self.pickView.curCalendarModel = curCalendarModel;
    self.headView.curCalendarModel = curCalendarModel;
}

#pragma mark - headview delegate
- (void)calendarHeadView:(ZLCalendarHeadView *)headView onPrevious:(id)previous {
    self.curCalendarModel = self.pickView.curCalendarModel.preMonth;
}

- (void)calendarHeadView:(ZLCalendarHeadView *)headView onNext:(id)next {
    self.curCalendarModel = self.pickView.curCalendarModel.nextMonth;
}

#pragma mark - pickview delegate
- (void)pickView:(ZLCalendarPickView *)pickView didSelectedDate:(ZLCalendarModel *)model {
    if (self.delegate && [self.delegate respondsToSelector:@selector(calendarView:didSelectedDate:)]) {
        [self.delegate calendarView:self didSelectedDate:model];
    }
    self.curCalendarModel = model;
}

@end
