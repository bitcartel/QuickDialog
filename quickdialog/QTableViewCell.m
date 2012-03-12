//
// Copyright 2011 ESCOZ Inc  - http://escoz.com
//
// Licensed under the Apache License, Version 2.0 (the "License"); you may not use this
// file except in compliance with the License. You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software distributed under
// the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
// ANY KIND, either express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//


@implementation QTableViewCell


- (QTableViewCell *)initWithReuseIdentifier:(NSString *)string {
    self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:string];
    
    return self;
}

/*
 To avoid problem of text value being too long for the label, we use solution from:
 http://stackoverflow.com/questions/9342278/quickdialog-value-too-long-for-qlabelelement
 
 Note that valueSize has been renamed labelSize.
 */
- (void)layoutSubviews {
    
    [super layoutSubviews];
    CGSize labelSize = CGSizeZero;
    
    if (self.textLabel.text!=nil)
        labelSize = [self.textLabel.text sizeWithFont:self.textLabel.font];
    
    //  Uncomment this if label size is to be restricted to half of the cell width
#if 0
    if (labelSize.width > self.contentView.bounds.size.width/2) {
        labelSize.width = self.contentView.bounds.size.width/2;
    }    
#endif
    
    CGSize imageSize = CGSizeZero;
    if (self.imageView!=nil)
        imageSize = self.imageView.frame.size;
    
    if (self.detailTextLabel.text ==nil) {
        CGRect labelFrame = self.textLabel.frame;
        self.textLabel.frame = CGRectMake(labelFrame.origin.x, labelFrame.origin.y,
                                          self.contentView.bounds.size.width - imageSize.width - 20, labelFrame.size.height);
    }
    else{
        CGRect labelFrame = self.textLabel.frame;
        self.textLabel.frame = CGRectMake(labelFrame.origin.x, labelFrame.origin.y,
                                          labelSize.width, labelFrame.size.height);
        
    }
    
    
    
    
    CGRect detailsFrame = self.detailTextLabel.frame;
    self.detailTextLabel.frame = CGRectMake(self.textLabel.frame.origin.x + labelSize.width,
                                            detailsFrame.origin.y, self.contentView.bounds.size.width - labelSize.width - 
                                            imageSize.width - 20, detailsFrame.size.height);
    
}


@end