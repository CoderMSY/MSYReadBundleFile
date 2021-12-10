//
//  MSYBundleFileListViewController.m
//  MSYReadBundleFile
//
//  Created by Simon Miao on 2021/12/10.
//

#import "MSYBundleFileListViewController.h"
#import <Masonry/Masonry.h>
#import <MSYTableView/MSYCommonTableView.h>
#import <MSYTableView/MSYCommonTableData.h>
#import <MSYTableView/MSYTableViewProtocol.h>

#import "MSYFilePreviewController.h"
#import "MSYReadBundleFile.h"
#import "MSYBundleFolderModel.h"
#import "MSYBundleFileModel.h"

@interface MSYBundleFileListViewController () <MSYTableViewProtocol>

@property (nonatomic, strong) MSYCommonTableView *listView;
@property (nonatomic, strong) NSString *bundlePath;

@end

@implementation MSYBundleFileListViewController

#pragma mark - lifecycle methods

- (instancetype)initWithBundleName:(NSString *)bundleName
{
    self = [super init];
    if (self) {
        self.bundlePath = [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:bundleName];
    }
    return self;
}

- (instancetype)initWithBundlePath:(NSString *)bundlePath
{
    self = [super init];
    if (self) {
        self.bundlePath = bundlePath;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.listView];
    [self initConstraints];
    
    [self loadDataSource];
}

#pragma mark - public methods

#pragma mark - private methods

- (void)initConstraints {
    [self.listView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

- (void)loadDataSource {
    MSYBundleFolderModel *folderModel = [MSYReadBundleFile getBundleFileWithBundlePath:self.bundlePath];
    
    NSMutableArray *rowDicList = [NSMutableArray array];
    for (id model in folderModel.dataSource) {
        NSString *title, *detail;
        if ([model isKindOfClass:[MSYBundleFolderModel class]]) {
            MSYBundleFolderModel *fModel = (MSYBundleFolderModel *)model;
            title = fModel.folderName;
            detail = fModel.folderPath;
        }
        else if ([model isKindOfClass:[MSYBundleFileModel class]]) {
            MSYBundleFileModel *fModel = (MSYBundleFileModel *)model;
            title = fModel.fileName;
            detail = fModel.filePath;
        }
        
        NSDictionary *rowDic = @{
            kRow_title : title ? : @"",
            kRow_detailTitle : detail ? : @"",
            kRow_extraInfo : model,
        };
        [rowDicList addObject:rowDic];
    }
    NSDictionary *sectionDic = @{
        kSec_rowContent : rowDicList,
        kSec_headerTitle : folderModel.folderName ? : @"",
        kSec_headerHeight : @(33)
    };
    self.listView.dataSource = [MSYCommonTableSection sectionsWithData:@[sectionDic]];
}

#pragma mark - MSYTableViewProtocol

- (void)msy_tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MSYCommonTableSection *sectionModel = self.listView.dataSource[indexPath.section];
    MSYCommonTableRow *rowModel = sectionModel.rows[indexPath.row];
    if ([rowModel.extraInfo isKindOfClass:[MSYBundleFolderModel class]]) {
        MSYBundleFolderModel *fModel = (MSYBundleFolderModel *)rowModel.extraInfo;
        MSYBundleFileListViewController *ctr = [[MSYBundleFileListViewController alloc] initWithBundlePath:fModel.folderPath];
        [self.navigationController pushViewController:ctr animated:YES];
    }
    else if ([rowModel.extraInfo isKindOfClass:[MSYBundleFileModel class]]) {
        MSYBundleFileModel *fModel = (MSYBundleFileModel *)rowModel.extraInfo;
        MSYFilePreviewController *ctr = [[MSYFilePreviewController alloc] init];
        ctr.filePath = fModel.filePath;
        [self.navigationController pushViewController:ctr animated:YES];
    }
}

#pragma mark - getter && setter

- (MSYCommonTableView *)listView {
    if (!_listView) {
        _listView = [[MSYCommonTableView alloc] initWithCellStyle:UITableViewCellStyleSubtitle];
    }
    return _listView;
}

@end
