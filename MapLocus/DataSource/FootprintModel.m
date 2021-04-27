//
//  FootprintModel.m
//  MapLocus
//
//  Created by Soul on 2021/4/27.
//

#import "FootprintModel.h"

@implementation FootprintModel

+ (instancetype)initFactoryModel:(NSString *)event
                            time:(NSDate *)time
                         address:(NSString *)address
                        latitude:(double)latitude
                       longitude:(double)longitude {
    
    FootprintModel *model = [FootprintModel new];
    model.event = event?:@"无事发生";
    model.time = time?:[NSDate date];
    model.address = address?:@"神秘地点";
    model.latitude = latitude?:0;
    model.longitude = longitude?:0;
    
    return model;
}

@end
