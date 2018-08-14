//
//  ZLCalendarHeadView.h
//  EOT
//
//  Created by LayZhang on 2018/8/13.
//  Copyright © 2018年 Zhanglei. All rights reserved.
//

#import "ZLMyBaseView.h"

#import "ZLCalendarModel.h"

@class ZLCalendarHeadView;
@protocol ZLCalendarHeadViewDelegate<NSObject>

- (void)calendarHeadView:(ZLCalendarHeadView *)headView onPrevious:(id)previous;
- (void)calendarHeadView:(ZLCalendarHeadView *)headView onNext:(id)next;

@end

@interface ZLCalendarHeadView : ZLMyBaseView

@property (nonatomic, weak) id<ZLCalendarHeadViewDelegate> delegate;
@property (nonatomic, strong) ZLCalendarModel *curCalendarModel;

@end


