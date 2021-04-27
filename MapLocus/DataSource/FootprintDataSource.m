//
//  FootprintDataSource.m
//  MapLocus
//
//  Created by Soul on 2021/4/27.
//

#import "FootprintDataSource.h"
#import "FootprintModel.h"

@implementation FootprintDataSource

+ (NSArray<FootprintModel *> *)yiyeFootprints {
    
    FootprintModel *tiananmen = [FootprintModel initFactoryModel:@"升国旗"
                                                            time:[NSDate date]
                                                         address:@"北京"
                                                        latitude:39.915
                                                       longitude:116.404];
    return @[
        tiananmen
    ];
}

+ (NSArray<FootprintModel *> *)soulFootprints {
    return [NSArray array];
}

+ (NSArray<FootprintModel *> *)togetherFootprints {
    NSMutableArray *result = [NSMutableArray array];
    // 从plist中读取数据
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"FootprintRecords" ofType:@"plist"];

    // 转化成数组遍历
    NSArray *arr = [NSArray arrayWithContentsOfFile:filePath];
    
    // 字典转Model
    for (NSDictionary *dict in arr) {
        if (dict) {
            NSDate *time = dict[@"time"];
            NSString *event = dict[@"event"];
            NSString *address= dict[@"address"];
            NSNumber *latitude = dict[@"latitude"];
            NSNumber *longitude = dict[@"longitude"];
            FootprintModel *tiananmen = [FootprintModel initFactoryModel:event
                                                                    time:time
                                                                 address:address
                                                                latitude:latitude.doubleValue
                                                               longitude:longitude.doubleValue];
            [result addObject:tiananmen];
        }
    }
    
    // 返回
    return result;
}

@end
