# ZipcodeZhCn [![Gem Version](https://badge.fury.io/rb/zipcode_zh_cn.svg)](http://badge.fury.io/rb/zipcode_zh_cn)

通过地址字符串在线获取中国大陆邮编。 数据来源 [http://opendata.baidu.com/post/s](http://opendata.baidu.com/post/s)

## 安装
    $ gem install zipcode_zh_cn

## 使用

```ruby
ZipcodeZhCn.get_zip_code("your address")
```
或者命令行:

    $ ZipcodeZhCN 昆山市
    215300


## Thanks

- Baidu. [http://opendata.baidu.com/post/s](http://opendata.baidu.com/post/s)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

