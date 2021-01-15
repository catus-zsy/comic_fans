<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员站点</title>
</head>
<link href="CSS/Admin.css" rel="stylesheet" type="text/css">
<body background="LOCAL/ARCO.jpg" style="background-repeat:no-repeat ;background-size:cover;background-attachment: fixed;">
<div class="h_menu">
	<ul class="navigation">
   		<li class="list"><a href="#">管理漫画</a>
   		   	<ul class="classify">
   		   		<li><a href="AD_Manga.jsp">添加漫画</a></li>
   		        <li><a href="Alter_Manga.jsp">修改漫画信息</a></li>
   		   	</ul>
   		</li>
   		<li class="list"><a href="#">管理站点</a>
			<ul class="classify">
				<li><a href="RecommendMg.jsp">漫画推荐</a></li>
   			</ul>
   		</li>
   		<li class="list"><a href="index.jsp">返回首页</a></li>
	</ul>
</div>

<form action="CleanDatabaseServlet" method="post">
	<button type="submit">清除数据库</button>
</form>

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