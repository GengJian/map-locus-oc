//
//  ViewController.m
//  MapLocus
//
//  Created by Soul on 2021/4/27.
//

#import "ViewController.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件
#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件

#import "FootprintDataSource.h"

@interface ViewController ()<BMKMapViewDelegate>
@property (nonatomic, strong) BMKMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"一页页去哪了";
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.mapView];
    
    NSArray *yezi = [FootprintDataSource yiyeFootprints];
    for (FootprintModel *model in yezi) {
        if (model && model.address != nil) {
            [self addPointWithModel:model];
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

#pragma mark - Action Method

/// 添加定点信息
- (void)addPointWithModel:(FootprintModel *)model {
    
    BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc] init];
    annotation.coordinate = CLLocationCoordinate2DMake(model.latitude, model.longitude);
    //设置标注的标题
    annotation.title = model.event;
    //副标题
    annotation.subtitle = [NSString stringWithFormat:@"%@ @ %@",model.time, model.address];
    [self.mapView addAnnotation:annotation];
}

#pragma mark - Lazy Method

- (BMKMapView *)mapView{
    if (!_mapView) {
        _mapView = [[BMKMapView alloc]initWithFrame:self.view.bounds];
        _mapView.delegate = self;
    }
    return _mapView;
}


@end
