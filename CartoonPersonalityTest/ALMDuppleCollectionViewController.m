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
@property (nonatomic, assign) int horiScroll;

@end

@implementation ALMDuppleCollectionViewController

static NSString * const reuseIdentifier = @"dupplePictureCell";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"COLLECTIONV TIME");
    [self.collectionViewOne registerClass: [ALMDuppleCollectionViewCell class] forCellWithReuseIdentifier: reuseIdentifier];
    
    self.dupplePictures = @[@"bart", @"flowey2", @"bob", @"buggs", @"louise", @"daffy5", @"frisk2", @"homer2", @"sam", @"sans3", @"tina3"];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear: animated];
    animated = NO;
    
NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval: 0.03
                                                  target: self
                                                selector: @selector(scroll)
                                                userInfo: nil
                                                 repeats: YES];
    
[[NSRunLoop currentRunLoop ]addTimer: timer forMode: NSRunLoopCommonModes];
    
}
-(void)scroll
{
    self.horiScroll += 5;
    self.collectionViewOne.contentOffset = CGPointMake(self.horiScroll, 0);
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView: (UICollectionView *)collectionView numberOfItemsInSection: (NSInteger)section
{
    return self.dupplePictures.count;
}

- (UICollectionViewCell *)collectionView: (UICollectionView *)collectionView cellForItemAtIndexPath: (NSIndexPath *)indexPath
{
    ALMDuppleCollectionViewCell *cellOne = (ALMDuppleCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier: reuseIdentifier forIndexPath: indexPath];
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
            mugshotView.layer.cornerRadius = cellOne.frame.size.height/2;
            
            if ([self.dupplePictures[indexPath.row]  isEqual: @"sans3"])
            {
                mugshotView.backgroundColor = [UIColor blueColor];
            }
            
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
    CGFloat cellLeg = (self.collectionViewOne.frame.size.width/4.5);
    
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
    return 35;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
