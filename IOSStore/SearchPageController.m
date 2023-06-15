//
//  SearchPageController.m
//  IOSStore
//
//  Created by Percy on 2023/4/22.
//

#import "SearchPageController.h"
#import "RecommendViewCell.h"

@interface SearchPageController ()<UITableViewDataSource, UITableViewDelegate>

/// 搜索框名字
@property (nonatomic, strong) UILabel *mySearchLabel;

@property(nonatomic,copy) NSString *placeholder;

/// 分类推荐标题
@property (nonatomic, strong) UILabel *myCategory;

/// 为你推荐标题
@property (nonatomic, strong) UILabel *myRecommend;

@end

@implementation SearchPageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mySearchLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 80, 100, 40)];
    self.mySearchLabel.text = @"搜索";
    [self.mySearchLabel setFont:[UIFont systemFontOfSize:32]];
    [self.view addSubview:_mySearchLabel];
    
    self.myCategory = [[UILabel alloc] initWithFrame:CGRectMake(20, 200, 100, 40)];
    self.myCategory.text = @"探索更多";
    [self.myCategory setFont:[UIFont systemFontOfSize:24]];
    [self.view addSubview:_myCategory];
    
    self.myRecommend = [[UILabel alloc] initWithFrame:CGRectMake(20, 380, 100, 40)];
    self.myRecommend.text = @"为你推荐";
    [self.myRecommend setFont:[UIFont systemFontOfSize:24]];
    [self.view addSubview:_myRecommend];
    
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(15, 135, 350, 50)];
    [self.view addSubview:searchBar];
    searchBar.placeholder = @"游戏、APP、故事等";
    
    NSArray *searchTitleArray = @[@"塔防",@"绘本",@"经营类游戏",@"休闲游戏",@"三国策略",@"公主游戏"];
    for(int i=0; i<[searchTitleArray count]; i++){
        NSInteger index = i % 2;
        NSInteger page = i / 2;
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(index * 150 + 60, 250 + (page * 35), 200, 30)];
        label.textColor = [UIColor colorWithRed:0/255.0 green:122/255.0 blue:255/255.0 alpha:1];
        label.text = searchTitleArray[i];
        [self.view addSubview:label];
    }
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(20, 420, self.view.frame.size.width - 40, self.view.frame.size.height - 20) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
     
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 65;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Configure the cell...
    NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[RecommendViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        // 去除分割线
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        //cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        
    }
    
    return cell;
}

@end
