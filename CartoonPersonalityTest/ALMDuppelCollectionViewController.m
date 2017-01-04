//
//  ALMDuppleCollectionViewController.m
//  CartoonPersonalityTest
//
//  Created by Alicia Marisal on 10/10/16.
//  Copyright © 2016 AliApps. All rights reserved.
//

#import "ALMDuppelCollectionViewController.h"
#import "ALMDuppelCollectionViewCell.h"
#import "ALMBackgroundLayer.h"

@interface ALMDuppelCollectionViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionViewOne;
@property (nonatomic, strong) NSArray *doppelPictures;
@property (nonatomic, assign) int horizontalScrollValue;

@end

@implementation ALMDuppelCollectionViewController

static NSString * const reuseIdentifier = @"dupplePictureCell";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.collectionViewOne registerClass: [ALMDuppelCollectionViewCell class] forCellWithReuseIdentifier: reuseIdentifier];
    
    self.doppelPictures = @[@"bart", @"flowey2", @"bob", @"buggs", @"louise", @"daffy5", @"frisk2", @"homer2", @"sam", @"sans3", @"tina3"];
}

//in viewDidAppear is when the collectionView scroll animation should happen, NSTimer creates smooth scrolling animation, NSRunLoop processes the timer, contentOffset is the actual scrolling motion.

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear: animated];
    animated = NO;
    
//    self.collectionViewOne.maskView.backgroundColor = [UIColor clearColor];
//    self.collectionViewOne.backgroundView.backgroundColor = [UIColor clearColor];
//    self.collectionViewOne.backgroundView.backgroundColor = [UIColor clearColor];
//    self.collectionViewOne.backgroundView.backgroundColor = [UIColor clearColor];
//    self.collectionViewOne.viewForLastBaselineLayout.backgroundColor = [UIColor clearColor];
    
    self.view.tintColor = [UIColor lightGrayColor];
    self.view.backgroundColor= [UIColor clearColor];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval: 0.025
                                                      target: self
                                                    selector: @selector(scroll)
                                                    userInfo: nil
                                                     repeats: YES];
    
    [[NSRunLoop currentRunLoop ]addTimer: timer forMode: NSRunLoopCommonModes];
    
}
-(void)scroll
{
    self.horizontalScrollValue += 2.5;
    self.collectionViewOne.contentOffset = CGPointMake(self.horizontalScrollValue, 0);
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
    ALMDuppelCollectionViewCell *cellOne = (ALMDuppelCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier: reuseIdentifier forIndexPath: indexPath];

        UIImage *mugshot = [[UIImage alloc] init];

        if (cellOne)
        {
            NSInteger otherIndex = indexPath.row % self.doppelPictures.count;
            NSString *test = self.doppelPictures[otherIndex];
            
            mugshot = [UIImage imageNamed: test];
            UIImageView *mugshotView = [[UIImageView alloc] initWithImage: mugshot];
            
            mugshotView.autoresizingMask = NO;
            mugshotView.autoresizesSubviews = NO;
            mugshotView.translatesAutoresizingMaskIntoConstraints = NO;
            mugshotView.frame = cellOne.bounds;
            mugshotView.contentMode = UIViewContentModeScaleToFill;
            mugshotView.clipsToBounds = YES;
            mugshotView.layer.cornerRadius = cellOne.frame.size.height/2;
    
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
