//
//  ZLCalendarModel.m
//  EOT
//
//  Created by LayZhang on 2018/8/13.
//  Copyright © 2018年 Zhanglei. All rights reserved.
//

#import "ZLCalendarModel.h"
#import "ZLCalendarUtils.h"

#define DayTimeInterval 24 * 60 * 60

@interface ZLCalendarModel()

@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSDateComponents *dateComponents;

@end

@implementation ZLCalendarModel
+ (instancetype)instanceWithDate:(NSDate *)date {
    ZLCalendarModel *model = [[ZLCalendarModel alloc] init];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    model.date = date;
    model.dateComponents = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday fromDate:date];
    return model;
}

- (NSInteger)year {
    return self.dateComponents.year;
}

- (NSInteger)month {
    return self.dateComponents.month;
}

- (NSInteger)day {
    return self.dateComponents.day;
}

- (ZLCalendarWeekDay)weekDay {
    return self.dateComponents.weekday - 1;
}

- (instancetype)copy {
    return [ZLCalendarModel instanceWithDate:self.date];
}

- (ZLCalendarModel *)nextMonth {
    NSDate *nextMonth = [self addLaterMonth:1];
    return [ZLCalendarModel instanceWithDate:nextMonth];
}

- (ZLCalendarModel *)preMonth {
    NSDate *preMonth = [self addLaterMonth:-1];
    return [ZLCalendarModel instanceWithDate:preMonth];
}

- (ZLCalendarModel *)preDays:(NSInteger)preDays {
    NSDate *preDate = [self.date dateByAddingTimeInterval:- preDays * DayTimeInterval];
    return [ZLCalendarModel instanceWithDate:preDate];
}

- (ZLCalendarModel *)nextDays:(NSInteger)nextDays {
    NSDate *nextDate = [self.date dateByAddingTimeInterval:nextDays * DayTimeInterval];
    return [ZLCalendarModel instanceWithDate:nextDate];
}

- (ZLCalendarModel *)firstDayInMonth {
    NSDate *firstDay = [self.date dateByAddingTimeInterval:(1 - self.day) * DayTimeInterval];
    return [ZLCalendarModel instanceWithDate:firstDay];
}

- (ZLCalendarModel *)lastDayInMonth {
    NSInteger days = [self totalDaysInMonth];
    NSDate *lastDay = [self.date dateByAddingTimeInterval:(days - self.day) * DayTimeInterval];
    return [ZLCalendarModel instanceWithDate:lastDay];
}

- (NSInteger)totalDaysInMonth {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay
                                   inUnit:NSCalendarUnitMonth
                                  forDate:self.date];
    return range.length;
}

- (NSDate *)addLaterMonth:(NSInteger)month {
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setMonth:month];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    return [calendar dateByAddingComponents:comps toDate:self.date options:0];
}

- (BOOL)isEquealToCalendarModel:(ZLCalendarModel *)model {
    if (self.year == model.year && self.month == model.month && self.day == model.day) {
        return YES;
    }
    return NO;
}

- (void)printDesc {
    NSLog(@"year %ld", (long)self.year);
    NSLog(@"month %ld", (long)self.month);
    NSLog(@"day %ld", (long)self.day);
    NSLog(@"weekday %ld", (long)self.weekDay);
}

@end







