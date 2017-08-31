#import "XYZTransactionDetailViewController.h"

@interface XYZTransactionDetailViewController () {
  XYZTransaction *_transaction;
  UILabel *_dateLabel;
}

@end

@implementation XYZTransactionDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
}

- (void)configureView {
  self.title = @"Transaction";
  self.view.backgroundColor = UIColor.whiteColor;
  
  _dateLabel = [[UILabel alloc] init];
  _dateLabel.textAlignment = NSTextAlignmentCenter;
  [self.view addSubview:_dateLabel];
}

- (void)displayTransaction:(XYZTransaction *)transaction {
  _transaction = [transaction copy];
  [self.view setNeedsLayout];
}

- (void)viewWillLayoutSubviews {
  _dateLabel.text = _transaction.date.description;
  [_dateLabel sizeToFit];
  _dateLabel.center = self.view.center;
}


@end
