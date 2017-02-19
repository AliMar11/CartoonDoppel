//
//  ALMDuppleCollectionViewController.m
//  CartoonPersonalityTest
//
//  Created by Alicia Marisal on 10/10/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import "ALMDoppelCollectionViewController.h"
#import "ALMDoppelCollectionViewCell.h"
#import "ALMBackgroundLayer.h"

@interface ALMDoppelCollectionViewController () <UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionViewOne;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionViewTwo;
@property (nonatomic, strong) NSArray *doppelPictures;
@property (nonatomic, assign) int horizontalScrollValue;
@property (strong, nonatomic) ALMDoppelCollectionViewCell *cellOne;
@property (strong, nonatomic) ALMDoppelCollectionViewCell *cellTwo;
@property (strong, nonatomic) NSArray *dopplePicturesReversed;

@end

@implementation ALMDoppelCollectionViewController

static NSString * const reuseIdentifier = @"doppelPictureCell";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//below are the arrays the collectionViews get the images from.
    self.doppelPictures = @[ @"leela",@"bart", @"flowey", @"PBsTwoCloseUp", @"garnet",@"sans", @"bob", @"louise", @"daffyCloseUp",@"jake1",@"buggsB", @"rickCloseUp",@"bender", @"steven", @"MtVCloseUp", @"homer", @"samCloseUp", @"tina"];
    
    self.dopplePicturesReversed = @[@"jake1", @"tina", @"sans", @"steven", @"daffyCloseUp", @"MtVCloseUp", @"samCloseUp", @"homer", @"leela", @"bob", @"PBsTwoCloseUp", @"garnet", @"flowey",@"louise", @"rickCloseUp", @"bender", @"bart", @"buggsB"];
}

//NSTimer creates smooth scrolling animation, NSRunLoop processes the timer, contentOffset is the automatic scrolling motion.
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear: animated];
    animated = NO;
    
    self.view.tintColor = [UIColor lightGrayColor];
    self.view.backgroundColor= [UIColor clearColor];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval: 0.025
                                                      target: self
                                                    selector: @selector(scroll)
                                                    userInfo: nil
                                                     repeats: YES];
    
    [[NSRunLoop currentRunLoop]addTimer: timer forMode: NSRunLoopCommonModes];
}

-(void)scroll
{
        self.horizontalScrollValue += 2.5;
        self.collectionViewOne.contentOffset = CGPointMake(self.horizontalScrollValue, 0);
   
    if (self.collectionViewTwo)
    {
        [self.collectionViewTwo setTransform:CGAffineTransformMakeScale(-1, 1)];
    }
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//returning a high number allows the allusion on infinite scrolling
- (NSInteger)collectionView: (UICollectionView *)collectionView numberOfItemsInSection: (NSInteger)section
{
    return 10000;
}

- (UICollectionViewCell *)collectionView: (UICollectionView *)collectionView cellForItemAtIndexPath: (NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = (ALMDoppelCollectionViewCell *)[ collectionView dequeueReusableCellWithReuseIdentifier: reuseIdentifier forIndexPath: indexPath];
    
    
        UIImage *mugshot = [[UIImage alloc] init];
        NSInteger doppelArrayIndex = indexPath.row % self.doppelPictures.count;
        NSString *nextCellImage = [[NSString alloc]init];
    
   
    if (cell.tag == 1)
    {
        nextCellImage = self.dopplePicturesReversed[doppelArrayIndex];
        [cell.contentView setTransform: CGAffineTransformMakeScale(-1, 1)];
    }
    else
    {
        nextCellImage = self.doppelPictures[doppelArrayIndex];
    }        
        mugshot = [UIImage imageNamed: nextCellImage];
        UIImageView *mugshotView = [[UIImageView alloc] initWithImage: mugshot];
    
        mugshotView.autoresizingMask = NO;
        mugshotView.autoresizesSubviews = NO;
        mugshotView.translatesAutoresizingMaskIntoConstraints = NO;
        mugshotView.frame = cell.bounds;
        mugshotView.contentMode = UIViewContentModeScaleToFill;
        mugshotView.clipsToBounds = YES;
        mugshotView.layer.cornerRadius = cell.frame.size.height/2;
  
        [cell addSubview: mugshotView];
    return  cell;
}

#pragma mark <collectionView visualSetup>

//size of each item in dequeCell
-(CGSize)collectionView: (UICollectionView *) collectionView
                 layout:(UICollectionViewLayout *) collectionViewLayout
 sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat cellLeg = (collectionView.frame.size.width/4.5);
    
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
