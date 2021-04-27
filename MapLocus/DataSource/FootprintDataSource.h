//
//  FootprintDataSource.h
//  MapLocus
//
//  Created by Soul on 2021/4/27.
//

#import <Foundation/Foundation.h>
#import "FootprintModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FootprintDataSource : NSObject

/// 页子走过的足迹
+ (NSArray<FootprintModel *> *) yiyeFootprints;

/// 耿健走过的足迹
+ (NSArray<FootprintModel *> *) soulFootprints;

/// 一起走过的足迹
+ (NSArray<FootprintModel *> *) togetherFootprints;

@end

NS_ASSUME_NONNULL_END
