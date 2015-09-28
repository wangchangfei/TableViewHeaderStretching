# 快速集成可拉伸头部图片的UITableView(TableViewHeaderStretching)

## 测试环境：Xcode 7.0，iOS 7.0 以上

### 集成步骤：
######0、将HeaderStretchingTableViewController文件夹拽入自己的项目中
######1、新建一个UITableViewController继承自HeaderStretchingTableViewController
######2、设置导航栏的背景图片 self.navigation_backgroundImageName = @"navigation_background"
######3、设置被拉伸图片view的高度 self.stretchingImageHeight = 200
######4、设置头部拉伸图片的名称 self.stretchingImageName = @"image_bg"
