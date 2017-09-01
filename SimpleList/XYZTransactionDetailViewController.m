#import "XYZTransactionDetailViewController.h"

@interface XYZTransactionDetailViewController () {
  XYZTransaction *_transaction;
  UILabel *_dateLabel;
  UIView *_borderView;
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
  
  _borderView = [[UIView alloc] init];
  _borderView.backgroundColor = UIColor.greenColor;
  [self.view addSubview:_borderView];
  
  _dateLabel = [[UILabel alloc] init];
  _dateLabel.textAlignment = NSTextAlignmentCenter;
  _dateLabel.text = _transaction.date.description;
  _dateLabel.backgroundColor = UIColor.whiteColor;
  [self.view addSubview:_dateLabel];
}

- (void)displayTransaction:(XYZTransaction *)transaction {
  _transaction = [transaction copy];
  _dateLabel.text = _transaction.date.description;
}

- (void)viewWillLayoutSubviews {
  [_dateLabel sizeToFit];
  _dateLabel.center = self.view.center;
  _borderView.frame = CGRectInset(_dateLabel.frame, -25, -25);
  _borderView.center = self.view.center;
}

@end
