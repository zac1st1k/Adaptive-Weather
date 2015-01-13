//
//  ViewController.m
//  Adaptive Weather
//
//  Created by Zac on 13/01/2015.
//  Copyright (c) 2015 1st1k. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSError *error;
    //加载一个NSURL对象
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.weather.com.cn/data/cityinfo/101200101.html"]];
    //将请求的url数据放到NSData对象中
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    //IOS5自带解析类NSJSONSerialization从response中解析出数据放到字典中
    NSDictionary *weatherDic = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:&error];
    NSDictionary *weatherInfo = [weatherDic objectForKey:@"weatherinfo"];
//    txtView.text = [NSString stringWithFormat:@"今天是 %@  %@  %@  的天气状况是：%@  %@ ",[weatherInfo objectForKey:@"date_y"],[weatherInfo objectForKey:@"week"],[weatherInfo objectForKey:@"city"], [weatherInfo objectForKey:@"weather1"], [weatherInfo objectForKey:@"temp1"]];
    self.cityUILabel.text = [NSString stringWithFormat:@"%@", [weatherInfo objectForKey:@"city"]];
    self.temperatureUILabel.text = [NSString stringWithFormat:@"%@", [weatherInfo objectForKey:@"temp1"]];
    self.weatherUILabel.text = [NSString stringWithFormat:@"%@", [weatherInfo objectForKey:@"weather"]];
    NSLog(@"weatherInfo字典里面的内容为--》%@", weatherDic );
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
