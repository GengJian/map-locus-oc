//
//  FootprintModel.h
//  MapLocus
//
//  Created by Soul on 2021/4/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FootprintModel : NSObject

/// 日志记录
@property (nonatomic, strong) NSString *event;

/// 时间
@property (nonatomic, strong) NSDate *time;

/// 地点名称
@property (nonatomic, strong) NSString *address;

/// 纬度
@property (nonatomic, assign) double latitude;

/// 经度
@property (nonatomic, assign) double longitude;

/// 工厂方法创建数据
/// @param event 记录事件
/// @param time 具体时间
/// @param address 地点名称
/// @param latitude 纬度
/// @param longitude 经度
+ (instancetype)initFactoryModel:(NSString *)event
                            time:(NSDate *)time
                         address:(NSString *)address
                        latitude:(double)latitude
                       longitude:(double)longitude;

@end

NS_ASSUME_NONNULL_END
