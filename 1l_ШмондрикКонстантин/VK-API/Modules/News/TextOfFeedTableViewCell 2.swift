//
//  TextOfFeedTableViewCell.swift
//  VK_ШмондрикКонстантин
//
//  Created by Константин Шмондрик on 30.01.2022.
//

import UIKit

class TextOfFeedTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var newsText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func config(textOfFeed: String){
       
        self.newsText.text = textOfFeed
        
    }
    
    /*
        self.newsText.text.addReadMoreStringToUILabel:(UILabel*)label {
        NSString *readMoreText = @" ...Read More";
        NSInteger lengthForString = label.text.length;
        if (lengthForString >= 100)
        {
            NSInteger lengthForVisibleString = 100;
            NSMutableString *mutableString = [[NSMutableString alloc] initWithString:label.text];
            NSString *trimmedString = [mutableString stringByReplacingCharactersInRange:NSMakeRange(lengthForVisibleString, (label.text.length - lengthForVisibleString)) withString:@""];
            NSInteger readMoreLength = readMoreText.length;
            NSString *trimmedForReadMore = [trimmedString stringByReplacingCharactersInRange:NSMakeRange((trimmedString.length - readMoreLength), readMoreLength) withString:@""];
            NSMutableAttributedString *answerAttributed = [[NSMutableAttributedString alloc] initWithString:trimmedForReadMore attributes:@{
                NSFontAttributeName : label.font
            }];
            UIColor *color = [UIColor colorWithRed:21.0/255.0 green:40.0/255.0 blue:86.0/255.0 alpha:1]; // select needed color
            NSDictionary *attrs = @{ NSForegroundColorAttributeName : color, NSUnderlineStyleAttributeName: @(NSUnderlineStyleNone)};
            NSMutableAttributedString *readMoreAttributed = [[NSMutableAttributedString alloc] initWithString:readMoreText attributes:attrs];
            [answerAttributed appendAttributedString:readMoreAttributed];
            label.attributedText = answerAttributed;
            UITapGestureRecognizer *readMoreGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(readMoreDidClickedGesture:)];
            readMoreGesture.numberOfTapsRequired = 1;
            [label addGestureRecognizer:readMoreGesture];
            label.userInteractionEnabled = YES;
        }
        else
        {
            
            NSLog(@"No need for 'Read More'...");
            
        }
    }
    
    self.readMoreDidClickedGesture:(id)sender
    {
        if(ReadMoretag==1)
        {
            
            ReadMoretag=0;
            
            NSString *readMoreText = @" Read Less";
            UIColor *color = [UIColor colorWithRed:21.0/255.0 green:40.0/255.0 blue:86.0/255.0 alpha:1]; // select needed color
            NSDictionary *attrs = @{ NSForegroundColorAttributeName : color };
            NSMutableAttributedString *readMoreAttributed = [[NSMutableAttributedString alloc] initWithString:readMoreText attributes:attrs];
            
            NSMutableAttributedString *answerAttributed = [[NSMutableAttributedString alloc] initWithString:StrProfileSummary attributes:@{
                NSFontAttributeName : LblProfilEsummary.font
            }];
            
            [answerAttributed appendAttributedString:readMoreAttributed];
            LblProfilEsummary.attributedText = answerAttributed;

        }
        
        else
        {
            ReadMoretag=1;
            [self addReadMoreStringToUILabel:LblProfilEsummary];
        }
    }
    */
    
    
    
    
}
