//
//  ZLCalendarUtils.m
//  EOT
//
//  Created by LayZhang on 2018/8/13.
//  Copyright © 2018年 Zhanglei. All rights reserved.
//

#import "ZLCalendarUtils.h"

@implementation ZLCalendarUtils

+ (NSArray *)getTotalDaysInCalendar:(ZLCalendarModel *)calendarModel {
    NSMutableArray * totalDays = [[NSMutableArray alloc] init];
    [totalDays addObjectsFromArray:[self getPreInCalendar:calendarModel]];
    [totalDays addObjectsFromArray:[self getCurInCalendar:calendarModel]];
    [totalDays addObjectsFromArray:[self getNextInCalendar:calendarModel]];
    return totalDays.copy;
}

+ (NSArray *)getPreInCalendar:(ZLCalendarModel *)calendarModel {
    ZLCalendarModel *firstDayInMonth = calendarModel.firstDayInMonth;
    ZLCalendarWeekDay weekDay = firstDayInMonth.weekDay;
    NSMutableArray * preDayLit = [[NSMutableArray alloc] init];
    for (NSInteger i = ZLCalendarWeekSunday; i < weekDay; i++) {
        ZLCalendarModel *model = [firstDayInMonth preDays:(weekDay - i)];
        model.canOperate = NO;
        [preDayLit addObject:model];
    }
    return preDayLit.copy;
}

+ (NSArray *)getCurInCalendar:(ZLCalendarModel *)calendarModel {
    NSInteger cTotalMouthDay = calendarModel.totalDaysInMonth;
    ZLCalendarModel *firstDayInMonth = calendarModel.firstDayInMonth;
    
    NSMutableArray * cDayLit = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < cTotalMouthDay; i++) {
        ZLCalendarModel *model = [firstDayInMonth nextDays:i];
        model.canOperate = YES;
        // TODO TEST
//        if (i == 9) {
//            model.hasNoted = YES;
//        }
        [cDayLit addObject:model];
    }
    return cDayLit.copy;
}

+ (NSArray *)getNextInCalendar:(ZLCalendarModel *)calendarModel {
    ZLCalendarModel *lastDayInMonth = calendarModel.lastDayInMonth;
    ZLCalendarWeekDay weekDay = lastDayInMonth.weekDay;
    
    NSMutableArray * nextDayLit = [[NSMutableArray alloc] init];
    for (NSInteger i = 1, curWeekDay = weekDay+1; curWeekDay < ZLCalendarWeekDayCount; i++,curWeekDay++) {
        ZLCalendarModel *model = [lastDayInMonth nextDays:i];
        model.canOperate = NO;
        [nextDayLit addObject:model];
    }
    return nextDayLit.copy;
}

@end
