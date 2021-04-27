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

@end
