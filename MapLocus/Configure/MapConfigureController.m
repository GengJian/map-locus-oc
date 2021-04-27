//
//  MapConfigureController.m
//  MapLocus
//
//  Created by Soul on 2021/4/27.
//

#import "MapConfigureController.h"

@interface MapConfigureController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *listView;

@end

@implementation MapConfigureController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = UIColor.systemPinkColor;
    [self.view addSubview:self.listView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (UITableView *)listView {
    if (!_listView) {
        _listView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        _listView.dataSource = self;
        _listView.delegate = self;
    }
    return _listView;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return [UITableViewCell new];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
    NSLog(@"traitCollectionDidChange");
}

@end
