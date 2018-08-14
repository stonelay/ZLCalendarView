//
//  ZLCalendarView.h
//  EOT
//
//  Created by LayZhang on 2018/8/13.
//  Copyright © 2018年 Zhanglei. All rights reserved.
//

#import "ZLMyBaseView.h"
#import "ZLCalendarModel.h"

@class ZLCalendarView;

@protocol ZLCalendarViewDelegate <NSObject>

- (void)calendarView:(ZLCalendarView *)calendarView didSelectedDate:(ZLCalendarModel *)model;

@end

@interface ZLCalendarView : ZLMyBaseView

@property (nonatomic, weak) id<ZLCalendarViewDelegate> delegate;
@property (nonatomic, strong) ZLCalendarModel *curCalendarModel;

@end


