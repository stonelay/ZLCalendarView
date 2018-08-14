//
//  ZLCalendarHeadView.m
//  EOT
//
//  Created by LayZhang on 2018/8/13.
//  Copyright © 2018年 Zhanglei. All rights reserved.
//

#import "ZLCalendarHeadView.h"

#define LEFTEDGE 0 * SCALE
#define BUTTONLEFT 9 * SCALE

@interface ZLCalendarHeadView()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *previousButton;
@property (nonatomic, strong) UIButton *nextButton;

@property (nonatomic, strong) NSArray *weekDaysLabel;

@end

@implementation ZLCalendarHeadView

- (void)initComponent {
    [self addSubview:self.titleLabel];
    [self addSubview:self.previousButton];
    [self addSubview:self.nextButton];
    for (UILabel *label in self.weekDaysLabel) {
        [self addSubview:label];
    }
}

- (void)setCurCalendarModel:(ZLCalendarModel *)curCalendarModel {
    if (!curCalendarModel) {
        return;
    }
    _curCalendarModel = curCalendarModel;
    self.titleLabel.text = [NSString stringWithFormat:@"%zd年%zd月%zd日", curCalendarModel.year, curCalendarModel.month, curCalendarModel.day];
}

#pragma mark - property
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.size = CGSizeMake(300 * SCALE, self.height - 30 * SCALE);
        _titleLabel.centerX = self.width / 2;
//        _titleLabel.top = 2 * SCALE;
        _titleLabel.textColor = ZLGray(33);
        _titleLabel.font = ZLBoldFont(17);
    }
    return _titleLabel;
}

- (UIButton *)previousButton {
    if (!_previousButton) {
        _previousButton = [[UIButton alloc] init];
        [_previousButton setImage:[UIImage imageNamed:@"icon_calendar_previous"] forState:UIControlStateNormal];
        [_previousButton addTarget:self action:@selector(handlePrevious:)
                  forControlEvents:UIControlEventTouchUpInside];
        [_previousButton sizeToFit];
        _previousButton.left = BUTTONLEFT;
        _previousButton.centerY = self.titleLabel.centerY;
        [_previousButton setEnlargeEdge:10 * SCALE];
    }
    return _previousButton;
}

- (UIButton *)nextButton {
    if (!_nextButton) {
        _nextButton = [[UIButton alloc] init];
        [_nextButton setImage:[UIImage imageNamed:@"icon_calendar_next"] forState:UIControlStateNormal];
        [_nextButton addTarget:self action:@selector(handleNext:)
              forControlEvents:UIControlEventTouchUpInside];
        [_nextButton sizeToFit];
        _nextButton.right = self.right - BUTTONLEFT;
        _nextButton.centerY = self.titleLabel.centerY;
        [_nextButton setEnlargeEdge:10 * SCALE];
    }
    return _nextButton;
}

- (NSArray *)weekDaysLabel {
    if (!_weekDaysLabel) {
        NSMutableArray *tArray = [[NSMutableArray alloc] init];
        NSArray *nArray = @[@"日", @"一", @"二", @"三", @"四", @"五", @"六"];
        CGFloat width = (self.width - 2 * LEFTEDGE) / 7;
        for (int i = 0; i < 7; i++) {
            UILabel *wdLabel = [self createWeekDayLabel];
            wdLabel.text = nArray[i];
            wdLabel.frame = CGRectMake(LEFTEDGE + width * i, self.titleLabel.bottom, width, 30 * SCALE);
            [tArray addObject:wdLabel];
        }
        _weekDaysLabel = [tArray copy];
    }
    return _weekDaysLabel;
}

- (UILabel *)createWeekDayLabel {
    UILabel *wdLabel = [[UILabel alloc] init];
    wdLabel.backgroundColor = ZLClearColor;
    wdLabel.textColor = ZLGray(33);
    wdLabel.textAlignment = NSTextAlignmentCenter;
    wdLabel.font = ZLNormalFont(12);
    return wdLabel;
}

#pragma mark - handle
- (void)handlePrevious:(UIButton *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(calendarHeadView:onPrevious:)]) {
        [self.delegate calendarHeadView:self onPrevious:sender];
    }
}

- (void)handleNext:(UIButton *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(calendarHeadView:onNext:)]) {
        [self.delegate calendarHeadView:self onNext:sender];
    }
}


@end








