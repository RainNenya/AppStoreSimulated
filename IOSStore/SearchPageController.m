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
    
    /*
     这里其实苹果商店页是整个一个UICollectionView包裹下的，你可以滑动一下苹果的商店页，他是整页，包括搜索框、标题栏都可以跟着一起滑动的，说明整个页面是一个整体，而不是仅仅下面列表那一部分是UITableView
     
     如果要实现苹果商店页的那种效果，就不能仅仅在cellForRowAtIndexPath里面写几句话就搞定了，要自定义至少三个UICollectionViewCell：最上方的搜索栏为一个单独cell，探索更多地下的六个搜索选项为一个cell，为你推荐底下的列表为一个cell，而那三个大标题（搜索、探索更多、为你推荐）可以公用一个UICollectionViewHeader，具体的实现代码量比较大，你可以自行百度
     */
    
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
    
    
    
    /*
     实际项目里最好不要这样用for循环的方式创建控件，因为这样会占用很多内存，有些项目对优化有要求。不过你现阶段这么写也没事，后面你有时间可以去了解一下UITableView或者UICOllectionView的嵌套，就是这个页面外面不是一个大的UICollectionView吗？这里你在这个UICollectionViewCell里面可以再嵌套一个小的UITabeView，这个UITabeView里面的每一个cell就是一个搜索选项，通过UITableView的复用可以减少资源的消耗。
     */
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
    //tableView.estimatedRowHeight = 65;//这句话是意思是动态设置cell高度，65只是一个预估值，实际上cell的高度是根据内容自动判断的
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

//这里你可以去看一下tableview的estimatedRowHeight这个属性（在上面的代码里面我写了用法），可以动态的设置cell高度，动态设置有利有弊，好处是方便，不用你自己算高度了，在复杂页面里面很好用，但弊端是有时候会出现闪屏，注意：如果你设置了tableView.estimatedRowHeight了，那么下面这段heightForRowAtIndexPath就可以注释掉了，两者不要同时用
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 65;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Configure the cell...
    NSString *cellID = @"cellID";
    
    //这里你可以去了解一下UITableView的复用机制，就是下面这句话为什么要设置cellID
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    
    if (cell == nil) {
        cell = [[RecommendViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        // 去除分割线
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        //cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        
    }
    
    /*
     UITableViewCell是系统默认的cell方式，但实际上项目里面一般都是自定义cell的，你可以百度一下如何自定义cell
     */
    
    
    
    return cell;
}

@end
