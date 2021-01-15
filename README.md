## PikaPika漫画网
## 你贴心的阅漫管家！
# 1. 引言
## 1.1编写目的
该系统是专门为喜欢看漫画的年轻群体量身打造的一款娱乐类的资源提供软件，该软件功能强大，它不仅可以快速给出用户搜索的漫画的资源或者资源链接，同时还可以自动向用户推荐与其搜索种类相关的漫画。此外，它可以根据用户的年龄段，设置青少年模式，对青少年其每天看漫画的时间提供限制，防止其沉溺于漫画。不仅如此，当用户关注的漫画有更新时，系统会及时向用户发送信息提醒。这大大地提高了漫画爱好者们追漫画的效率和便捷度，节省了很多不必要的时间。为了能更好地获取用户的需求，我们对观看漫画的网站以及漫画作品的进行了深入的调查，并对漫画爱好者进行了深度访问，经过进一步的探讨和分析，得出这份软件需求规格说明书，该说明书说明了系统应具有的功能模块，使系统开发者们能清楚地了解到用户的需求。

该需求规格说明书编制目的是明确本系统的详细需求，供用户确认系统的功能和性能，和用户形成一致的理解和确认，作为进一步详细设计软件的基础。
## 1.2项目背景
本次待开发项目为：追漫达人
软件管理员通过该软件上传漫画资源或其链接、发布系统公告、和用户互动、获取用户反馈等等。
用户通过该软件在终端获取漫画资源，设置漫画更新提醒，查看漫画推荐，发表评论等等。
## 1.3预期读者和阅读建议
此需求规格说明书针对项目经理、设计人员、开发人员、用户及测试人员。本文分别介绍了产品的说明、用户功能及运行环境，系统的功能的具体描述。
## 1.4项目范围
该软件面向漫画爱好者，后期或可以增加漫画作者群体。
## 1.5参考资料
（待补充）
# 2.总体描述
## 2.1目标
### 2.1.1开发背景
以下主要基于漫画爱好者群体的特点进行描述
漫画爱好者
目前，市面上大部分的漫画作品有一个共同的特点——更新时间缓慢且更新周期不尽相同，且很多时候不同漫画的更新平台不尽相同，漫画爱好者不得不在各个平台之间辗转，这使得他们在观看漫画之余还要花很多时间在找漫画上，浪费了很多不必要的时间。
### 2.1.2开发意图
旨在提供一个更加便捷的追更漫画的平台，使得漫画爱好者能及时且快速地获得漫画资源；
在项目开发过程中，加强合作意识，培养团队合作实践能力; 
旨在软件使用流畅，可维护性强，服务提供针对性强。
### 2.1.3应用目标
漫画爱好者群体
### 2.1.4产品前景
#### 市场分析
市场上已经存在很多用来看漫画的软件，但是每个软件涵盖的内容都不够全面，漫画爱好者不能只依靠一个软件，甚至还是需要在各个网站上寻找需要的漫画资源，所以这类软件其实并没有很好地满足用户的真正需求。
#### 竞争优势
可以提供几乎涵盖全网的漫画资源以及相关的资源，可以极大程度上地满足用户的需求。
在满足客户需求的基础上，有时间限制功能，可以得到很多家长的认可，提高了市场的包容度。
系统具有更新提醒功能，很大程度上节省了用户的时间。
## 2.2用户特点
### 2.2.1最终用户及特点
该软件的主要用户就是漫画爱好者，该群体有以下特点：
该群体使用该软件的目的是：找到喜欢看的漫画资源，在看漫画的过程中可以根据自己的心情发表评论，在等待漫画的更新期间会收到漫画的更新通知。对于年龄较小的青少年用户可以限制看漫画的时间，以防过度浪费时间。
### 2.2.2 软件使用频度
软件正常使用频率：因为用户个体间看漫画时间段的差异，每天都要使用。
### 2.2.3用户场景
#### 背景
##### （1） 典型用户
姓名：
性别：
身份：
个人情况：
典型场景：
典型描述：

姓名：
性别：
身份：
个人情况：
典型场景：
典型描述：

姓名：
性别：
身份：
个人情况：
典型场景：
典型描述：

姓名: 
性别：
身份：
个人情况：
典型场景：
典型描述：

姓名: 
性别：
身份：
个人情况：
典型场景：
典型描述：

##### （2） 用户需求和待解决问题
对于喜欢看漫画的年轻人来说，漫画的种类大多不局限于一个国家或者一个地区，由于版权等各种原因的限制，市面上的软件漫画资源大多不全面，因此，他们主要还是依靠自主搜索资源或者交流平台的资源分享获得漫画资源，为此他们花费的时间成本很大。
　　
##### （3） 假设：
###### A、软件功能全部实现 　
###### B、上述用户使用了本软件
#### 场景
周末，被窝，作业全部完成的张XX抱着被子百无聊赖，突然，手机传来一声短信提示音，他打开手机，上面写道：可爱的沧海一声笑（昵称）您好，您喜欢的漫画《进击的巨人》最新一季已经开始更新，请尽情享用哦。“哈吼吼吼吼”，张XX发出平地一声雷般的笑声，“爷的快乐要来了哈哈哈哈！！！！！”
房间内，五年级的刘某某在拿着手机看漫画，厨房传来妈妈催促吃饭的声音，他也不为所动，在其母亲即将暴走的边缘，其软件突然自锁，显示使用时间到时，刘某某放下了手机走去餐桌吃饭了。
闲暇时间，少女心满满的姜某某，捧着手机冒着星星眼，在漫画的评论区写道：国家欠我一个巴卫！！！
看完了最新一话的《步天歌》，下拉界面，出现了《哑舍》、《浮生物语》、《长歌行》等作品，《长歌行》看起来不错，韩某某默默点了一个收藏。
### 2.2.4用例图
管理员
![image](https://github.com/catus-zsy/comic_fans/blob/main/images/UseCase/UseCase_admin.jpg)
客户端
![image](https://github.com/catus-zsy/comic_fans/blob/main/images/UseCase/UseCase_customer.jpg)
### 2.2.5 类图
![image](https://github.com/catus-zsy/comic_fans/blob/main/images/UseCase/Class.jpg)
## 2.3功能需求
## 2.4假定和约束
### 2.4.1假定
( 1 ) 可操作性：假定使用的用户在经过一段时间熟悉之后，可以灵活地操作本系统。
( 2 ) 用户支持：假定在本系统开发的各个环节中得到用户的有效支持和配合。
( 3 ) 技术支持：假定开发初期，项目成员充分理解本系统的需求，并掌握一定的开发语言基础。在开发过程中遇到技术问题，可以及时得到老师的指导与帮
助。
( 4 )人员配合：假定项目所有成员在项目开发过程中积极配合，并且不会产生突发情况的而导致项目成员无法正常参与开发工作。
( 5 ) 时间限定：假定项目的截止时间不会提前。
( 6 ) 需求限定：假定项目需求确定之后，不会有太大改变。
### 2.4.1约束
人员约束：
团队成员均为大三学生，共5人。
#### 管理约束：
##### （1）本次开发，实行以一人担任项目管理者，分工合作的模式进行。力求每个人的分工涉及开发过程中的所有流程，并能够按照进度表进行，开发过程中遇
到的问题将通过项目会议得到一致的解决。
##### （2）项目成员需要明确自身责任，按时完成自身任务，互相配合。遇到问题时，项目管理者必须能够有效进行协调，使项目得到快速、有效的推进。
#### 技术约束：
##### （1）项目成员在相关开发语言掌握方面存在一定欠缺，缺乏相关项目经验，在文档编写方面也有待提升。
##### （2）项目成员在美工方面非专业人士，能力有限。
##### （3）本系统开发周期较短，时间相对紧张。
#### 其他约束：
由于在开发期间，项目成员还存在其他学科的学习任务，将对项目进度造成一定的影响。
## 2.5运行环境
Web端、客户端
# 3.界面原型
## 3.1 管理员界面
### 3.1.1 管理员登录
![image](https://github.com/catus-zsy/comic_fans/blob/main/images/admin/admin_log_In.png)
### 3.1.2 管理员首页
![image](https://github.com/catus-zsy/comic_fans/blob/main/images/admin/admin_home.jpg)
### 3.1.2 管理员站点管理
![image](https://github.com/catus-zsy/comic_fans/blob/main/images/admin/admin_books.png)
![image](https://github.com/catus-zsy/comic_fans/blob/main/images/admin/admin_web.png)
#### 3.1.2.1 管理员编辑漫画tag
![image](https://github.com/catus-zsy/comic_fans/blob/main/images/admin/admin_edit.png)
#### 3.1.2.2 管理员上传漫画
![image](https://github.com/catus-zsy/comic_fans/blob/main/images/admin/admin_upload.png)
## 3.2 客户端界面（未添加部分内容）
### 3.2.1 用户登录
![image](https://github.com/catus-zsy/comic_fans/blob/main/images/customer/customer_login.jpg)
### 3.2.2 用户注册
![image](https://github.com/catus-zsy/comic_fans/blob/main/images/customer/register.jpg)
### 3.2.3 首页
![image](https://github.com/catus-zsy/comic_fans/blob/main/images/customer/customer_home.jpg)
### 3.2.4 搜索结果
![image](https://github.com/catus-zsy/comic_fans/blob/main/images/customer/customer_search1.jpg)
![image](https://github.com/catus-zsy/comic_fans/blob/main/images/customer/customer_search2.jpg)
### 3.2.5 阅读界面
![image](https://github.com/catus-zsy/comic_fans/blob/main/images/customer/customer_login.jpg)
### 3.2.6 订阅界面（含：右键功能示意）
![image](https://github.com/catus-zsy/comic_fans/blob/main/images/customer/customer_subscribe.jpg)
### 3.2.7 预期界面总览
![image](https://github.com/catus-zsy/comic_fans/blob/main/images/customer/customer_all.jpg)
## 3.4 系统功能描述及验收验证标准
见[管理员](https://github.com/catus-zsy/comic_fans/blob/main/data/%E5%8A%9F%E8%83%BD%E5%AE%A1%E6%9F%A5-%E7%AE%A1%E7%90%86%E5%91%98.xlsx) 和 [客户端](https://github.com/catus-zsy/comic_fans/blob/main/data/%E5%8A%9F%E8%83%BD%E5%AE%A1%E6%9F%A5-%E7%94%A8%E6%88%B7.xlsx)功能审查表格
