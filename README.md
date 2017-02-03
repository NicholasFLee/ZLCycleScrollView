# ZLCycleScrollView
## Usage

使用下面这个方法 第一个参数填写一个保护图片路径的 String 数组, 后面的闭包可以拿到被点击的是第几张图片.
ZLScrollView.init(ds: [String], didSelect: (NSInteger) -> Void)
