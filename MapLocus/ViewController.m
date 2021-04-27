//
//  ViewController.m
//  MapLocus
//
//  Created by Soul on 2021/4/27.
//

#import "ViewController.h"
#import "MapConfigureController.h"

#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件
#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件

#import "FootprintDataSource.h"

@interface ViewController ()<BMKMapViewDelegate>
@property (nonatomic, strong) BMKMapView *mapView;

@property (nonatomic, strong) NSDateFormatter *dateFormatter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"一页页去哪了";
//    [self addConfigureItem];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.mapView];
    
    NSArray *yezi = [FootprintDataSource togetherFootprints];
    for (FootprintModel *model in yezi) {
        if (model && model.address != nil) {
            [self _addPointWithModel:model];
        } else {
            NSLog(@"数据有问题");
        }
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.mapView viewWillAppear];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.mapView viewWillDisappear];
}

#pragma mark - UILayout Method
- (void)addConfigureItem {
    UIBarButtonItem *mapConfigureItem = [[UIBarButtonItem alloc] initWithTitle:@"配置地图"
                                                                         style:UIBarButtonItemStylePlain
                                                                        target:self
                                                                        action:@selector(pushToSettingController)];
    self.navigationItem.leftBarButtonItem = mapConfigureItem;
}

#pragma mark - Action Method

/// 添加定点信息
- (void)_addPointWithModel:(FootprintModel *)model {
    BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc] init];
    annotation.coordinate = CLLocationCoordinate2DMake(model.latitude, model.longitude);
    //设置标注的标题
    annotation.title = model.event;
    //副标题
    annotation.subtitle = [NSString stringWithFormat:@"%@ @ %@", [self.dateFormatter stringFromDate:model.time], model.address];
    [self.mapView addAnnotation:annotation];
}

#pragma mark - Push/Pop Method

/// 推出设置地图页面
- (void)pushToSettingController {
    MapConfigureController *settingVc = [[MapConfigureController alloc] init];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:settingVc
                           animated:YES
                         completion:^{
            NSLog(@"唤起配置地图页面");
        }];
    });
}

#pragma mark - Lazy Method

- (BMKMapView *)mapView{
    if (!_mapView) {
        _mapView = [[BMKMapView alloc]initWithFrame:self.view.bounds];
        _mapView.mapType = BMKMapTypeStandard;
        _mapView.delegate = self;
    }
    return _mapView;
}

- (NSDateFormatter *)dateFormatter {
    if (!_dateFormatter) {
        _dateFormatter = [[NSDateFormatter alloc] init];
        [_dateFormatter setDateStyle:NSDateFormatterShortStyle];
    }
    return _dateFormatter;
}


@end
