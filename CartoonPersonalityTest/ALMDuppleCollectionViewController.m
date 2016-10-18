//
//  ALMDuppleCollectionViewController.m
//  CartoonPersonalityTest
//
//  Created by Alicia Marisal on 10/10/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import "ALMDuppleCollectionViewController.h"
#import "ALMDuppleCollectionViewCell.h"

@interface ALMDuppleCollectionViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionViewOne;

@property (nonatomic, strong) NSArray *dupplePictures;

@end

@implementation ALMDuppleCollectionViewController

static NSString * const reuseIdentifier = @"collectionCellOne";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"COLLECTIONV TIME");
    [self.collectionViewOne registerClass:[ALMDuppleCollectionViewCell class] forCellWithReuseIdentifier: reuseIdentifier];
    
    self.dupplePictures = @[@"bart", @"flowey2", @"bob", @"buggs", @"louise", @"daffy5", @"frisk", @"homer2", @"sam", @"sans", @"tina2"];
    
    [self.collectionViewOne reloadData];
}

//trial collectionView auto-scroll
-(void)viewDidAppear:(BOOL)animated
{
    NSIndexPath *currentItem = [self.dupplePictures objectAtIndex:0];
    NSIndexPath *nextItem = [NSIndexPath indexPathForItem: (long)[self.dupplePictures objectAtIndex: 1] inSection: currentItem.section];
    
    [self.collectionViewOne scrollToItemAtIndexPath: nextItem atScrollPosition:UICollectionViewScrollPositionTop animated:YES];
}

#pragma mark <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dupplePictures.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ALMDuppleCollectionViewCell *cellOne = (ALMDuppleCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath: indexPath];
    
     [[[cellOne contentView] subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];

        UIImage *mugshot = [[UIImage alloc] init];
        
        if (cellOne)
        {
            mugshot = [UIImage imageNamed: self.dupplePictures[indexPath.row]];
            
            UIImageView *mugshotView = [[UIImageView alloc] initWithImage: mugshot];
            mugshotView.autoresizingMask = NO;
            mugshotView.autoresizesSubviews = NO;
            mugshotView.translatesAutoresizingMaskIntoConstraints = NO;
            mugshotView.frame = cellOne.bounds;
            mugshotView.contentMode = UIViewContentModeScaleToFill;
            mugshotView.clipsToBounds = YES;
            mugshotView.layer.cornerRadius = self.view.frame.size.height/2;

            [cellOne addSubview: mugshotView];
        }

    return cellOne;
}

#pragma mark <collectionView visualSetup>
//size of each item in dequeCell
-(CGSize)collectionView: (UICollectionView *) collectionView
                 layout:(UICollectionViewLayout *) collectionViewLayout
 sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat cellLeg = (self.collectionViewOne.frame.size.width/3);
    
    return CGSizeMake(cellLeg, cellLeg);
}

//edge insets of dequeCell
-(UIEdgeInsets)collectionView: (UICollectionView *)collectionView
                       layout:(UICollectionViewLayout *)collectionViewLayout
       insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

//collectionView minimal spacing
-(CGFloat)collectionView: (UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 45;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
