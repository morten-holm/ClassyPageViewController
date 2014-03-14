//
// Created by Morten Holm on 14/03/14.
// Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "CollectionViewViewController.h"
#import "CollectionViewCell.h"

@interface CollectionViewViewController()
@property (nonatomic) UICollectionView *collectionView;
@end

@interface CollectionViewViewController(UICollectionViewDataSource)<UICollectionViewDataSource>
@end

@implementation CollectionViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(100, 100);
    layout.minimumInteritemSpacing = 20;
    layout.minimumLineSpacing = 20;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;

    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];

    [self.view addSubview:self.collectionView];
}

@end

@implementation CollectionViewViewController(UICollectionViewDataSource)

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10000;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.text = [NSString stringWithFormat:@"%d", indexPath.item];
    return cell;
}

@end