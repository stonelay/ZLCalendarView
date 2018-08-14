//
//  ZLCalendarPickView.h
//  EOT
//
//  Created by LayZhang on 2018/8/13.
//  Copyright © 2018年 Zhanglei. All rights reserved.
//

#import "ZLMyBaseView.h"
#import "ZLCalendarView.h"
@class ZLCalendarModel;
@class ZLCalendarPickView;

@protocol ZLCalendarPickViewDelegate <NSObject>

- (void)pickView:(ZLCalendarPickView *)pickView didSelectedDate:(ZLCalendarModel *)model;

@end

@interface ZLCalendarPickView : ZLMyBaseView

@property (nonatomic, weak) id<ZLCalendarPickViewDelegate> delegate;
@property (nonatomic, strong) ZLCalendarModel *curCalendarModel;

@end
