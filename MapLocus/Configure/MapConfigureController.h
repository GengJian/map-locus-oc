//
//  MapConfigureController.h
//  MapLocus
//
//  Created by Soul on 2021/4/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol configureControllerDelegate <NSObject>

/// 当在设置页面发生配置更新后回调至地图页面通知刷新
/// @param changeEvent 描述修改内容
- (void)didMapConfigureChanged:(NSString *)changeEvent;

@end

/// 地图设置页面
@interface MapConfigureController : UIViewController

@end

NS_ASSUME_NONNULL_END
