//
//  ZLCalendarUtils.h
//  EOT
//
//  Created by LayZhang on 2018/8/13.
//  Copyright © 2018年 Zhanglei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZLCalendarModel.h"

@interface ZLCalendarUtils : NSObject

+ (NSArray *)getTotalDaysInCalendar:(ZLCalendarModel *)calendarModel;

@end
