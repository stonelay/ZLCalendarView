//
//  CalendarDemoController.m
//  ZLCalendarView
//
//  Created by LayZhang on 2018/8/14.
//  Copyright © 2018年 Zhanglei. All rights reserved.
//

#import "CalendarDemoController.h"

#import "ZLCalendarView.h"
#import "ZLCalendarModel.h"

@interface CalendarDemoController ()<ZLCalendarViewDelegate>

@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) ZLCalendarView *calendarView;

@end

@implementation CalendarDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.calendarView];
}

- (NSString *)controllerTitle {
    return @"Calendar Demo";
}

#pragma mark - property
- (ZLCalendarView *)calendarView {
    if (!_calendarView) {
        _calendarView = [[ZLCalendarView alloc] initWithFrame:CGRectMake(0, 64, SCREENWIDTH, 300 * SCALE)];
        _calendarView.curCalendarModel = [ZLCalendarModel instanceWithDate:[NSDate new]];
        _calendarView.delegate = self;
    }
    return _calendarView;
}

#pragma mark - calendarview delegate
- (void)calendarView:(ZLCalendarView *)calendarView didSelectedDate:(ZLCalendarModel *)model {
    NSLog(@"%ld, %ld, %ld",(long)model.year, (long)model.month, (long)model.day);
}

@end
