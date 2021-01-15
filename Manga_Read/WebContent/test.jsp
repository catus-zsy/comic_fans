<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>Test</title>
<link rel="stylesheet" href="testcss.css">
<!--testnocss.css是选择器部分，iconfont.css是阿里的图标库-->
<!--jsp部分和css部分在同一个目录下，所以就没写路径-->
</head>
<body>
	<div class="h_menu">
		<ul class="navigation">
			<li class="list"><a href="#">Home</a></li>
			<li class="list"><a href="#">Classify</a>
				<ul class="classify">
					<li><a href="#">Item1</a></li>
					<li><a href="#">Item2</a></li>
					
					<!-- Item1和Item2整体是一个ul块，属于classify类  -->
				</ul>
			</li>
		</ul>
	</div>

<script>
var list = document.querySelectorAll('.list');		//获取文档中 class=".list" 的所有元素:

function accordion(e) {
    e.stopPropagation();		//该方法将停止事件的传播，阻止它被分派到其他 Document 节点。在事件传播的任何阶段都可以调用它。注意，虽然该方法不能阻止同一个 Document 节点上的其他事件句柄被调用，但是它可以阻止把事件分派到其他节点。
    if (this.classList.contains('active')) {		//contains判断包含关系，返回true或false
        this.classList.remove('active');		//remove() 方法用于从下拉列表删除选项。
    } else		//classList 属性返回元素的类名，作为 DOMTokenList 对象。该属性用于在元素中添加，移除及切换 CSS 类。classList 属性是只读的，但你可以使用 add() 和 remove() 方法修改它。
    if (this.parentElement.parentElement.classList.contains('active')) {	
    	// parentElement 属性，就是在 DOM 层次结构定义的上下级关系，如果元素A包含元素B，那么元素B就可以通过 parentElement 属性来获取元素A。 
        this.classList.add('active');		//add() 方法用于向 <select> 添加一个 <option> 元素。所以要有两个参数？但是好像在classList后面就只需要一个参数
    } else
    {
        for (i = 0; i < list.length; i++) {
            list[i].classList.remove('active');
        }
        this.classList.add('active');
    }
}
for (i = 0; i < list.length; i++) {
    list[i].addEventListener('click', accordion);	//addEventListener() 方法用于向指定元素添加事件句柄。
}
</script>	
</body>
</html>