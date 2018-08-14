//
//  ZLCalendarModel.h
//  EOT
//
//  Created by LayZhang on 2018/8/13.
//  Copyright © 2018年 Zhanglei. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ZLCalendarWeekDay) {
    ZLCalendarWeekSunday    = 0,
    ZLCalendarWeekMondy     = 1,
    ZLCalendarWeekTuesday   = 2,
    ZLCalendarWeekWednesday = 3,
    ZLCalendarWeekThursday  = 4,
    ZLCalendarWeekFriday    = 5,
    ZLCalendarWeekSaturday  = 6,
    
    ZLCalendarWeekDayCount  = 7,
};

@interface ZLCalendarModel : NSObject

@property (nonatomic, assign) NSInteger year;
@property (nonatomic, assign) NSInteger month;
@property (nonatomic, assign) NSInteger day;

@property (nonatomic, assign) ZLCalendarWeekDay weekDay;

@property (nonatomic, assign) BOOL isCellSelected;
@property (nonatomic, assign) BOOL hasNoted;
@property (nonatomic, assign) BOOL canOperate;

+ (instancetype)instanceWithDate:(NSDate *)date;

- (ZLCalendarModel *)nextMonth;
- (ZLCalendarModel *)preMonth;
- (ZLCalendarModel *)preDays:(NSInteger)preDays;
- (ZLCalendarModel *)nextDays:(NSInteger)nextDays;
- (ZLCalendarModel *)firstDayInMonth;
- (ZLCalendarModel *)lastDayInMonth;
- (NSInteger)totalDaysInMonth;

- (BOOL)isEquealToCalendarModel:(ZLCalendarModel *)model;

- (void)printDesc;

@end
