<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>TreePanel示例</title>

		<link rel="stylesheet" type="text/css" href="<%=path%>/extjs/resources/css/ext-all.css" />
		<link rel="stylesheet" type="text/css" href="<%=path%>/extjs/resources/css/ItemSelector.css">
		<script type="text/javascript" src="<%=path%>/extjs/examples/shared/include-ext.js"></script>
		<!-- 	<script type="text/javascript" src="extjs/examples/shared/options-toolbar.js"></script> -->
		<script type="text/javascript" src="<%=path%>/extjs/examples/shared/states.js"></script>
		<script type="text/javascript" src="<%=path%>/extjs/locale/ext-lang-zh_CN.js"></script>
		<%--<script type="text/javascript" src="<%=path%>/js/demo.js"></script>--%>
	</head>

	<body>
	<script>
        Ext.Loader.setConfig({enabled: true});
        Ext.Loader.setPath('Ext.ux', 'extjs/src/ux');
        Ext.require([
            'Ext.tab.*',
            'Ext.ux.TabCloseMenu'
        ]);
        window.onload=function(){
            //alert(userRealName.value);
            var userName;
            userName.innerHTML='&nbsp;&nbsp;'+userRealName.value+'&nbsp;&nbsp;';
            //getUserRealName(userName);
        }
        //点击退出链接跳转登陆
        function loginOut(){
            Ext.MessageBox.confirm("提示","您确定退出吗？",function(result){
                if(result=='yes'){
                    window.location='j_spring_security_logout';
                }
            });
        }

        //function getUserRealName(userName){
        //	Ext.Ajax.request({
        //		url:'user/getUserRealName',
        //		method:'POST',
        //		success:function(response){
        //			var responseText=Ext.decode(response.responseText);
        //			userName.innerHTML='欢迎你!&nbsp&nbsp'+responseText.data;
        //		},
        //		failure:function(response){
        //			window.location.href='loginlogout/toLogin';
        //		}
        //	});
        //}

        Ext.onReady(function(){
            //数据模型
            Ext.define('menuInfo', {
                extend: 'Ext.data.Model',
                fields: [
                    {name: 'id', type: 'int'},
                    {name: 'text', type: 'string'},
                    {name: 'leaf', type: 'boolean'},
                    {name: 'url', type: 'string'},
                    {name: 'description', type: 'string'},
                    {name: 'expanded', type: 'boolean'}
                ]
            });
            // 创建一个TreeStore，TreeStore负责为Tree提供数据
            var store = Ext.create('Ext.data.TreeStore',{
                model : 'menuInfo',
                proxy : {
                    type : 'ajax',
                    url : 'menu/toUserMenu'
                },
                listeners:{
                    load : function(store, record, records, eOpts)
                    {
                        if(records==null){
                            location.href="/loginlogout/toLogin";
                            return false;
                        }
                        console.log('length:'+records.length);
                        if(records.length>0)
                        {
                            for (var i = 0; i < records.length; i++)
                            {
                                if(records[i].data.children[0].leaf)
                                {
                                    //var frame = Ext.getDom('mainFrame');
                                    //frame.src = '<%=request.getContextPath()%>' + records[i].data.children[0].url;var tabpanel = Ext.getCmp('Main_MasterPage_TabMain');
                                    var n = tabpanel.getComponent(record.data.id);
                                    if (!n) {
                                        n = tabpanel.add({
                                            id: records[i].data.children[0].id,
                                            title: records[i].data.children[0].text,
                                            closable: true,
                                            html: '<iframe id="reporter-iframe" src="' + records[i].data.children[0].url + '" frameborder="0" scrolling="auto"  width="100%" height="100%" style="height:560px;width:100%;overflow-y:auto;" ></iframe>'
                                        });
                                        tabpanel.setActiveTab(n);
                                    }
                                    return false;//相当于break
                                }
                            }
                        }
                    }
                }
            });

            Ext.create('Ext.container.Viewport',
                {
                    layout: 'border',
                    items: [
                        // 上面区域的内容
                        {
                            region: 'north',
                            html: '<div >LOGO</div><div style="display:inline;float:right;"><a href=javascript:changePassword()>修改密码</a>&nbsp&nbsp|&nbsp&nbsp<a href=javascript:loginOut()>安全退出</a></div><div style="float:right;" id="clock" ></div><div style="float:right;" id="userName" ></div>',
                            height: 40,
                            border: false,
                            margins: '0 0 5 0'
                        },
                        // 左边区域的内容
                        {
                            region: 'west',
                            xtype: 'treepanel', // 表明这是Ext.tree.Panel
                            title: '功能菜单',
                            listeners:{
                                // 为itemclick事件添加监听器
                                itemclick : function(view , record, item)
                                {

                                    // 如果是叶子节点
                                    if(record.data.leaf)
                                    {
                                        // 获取页面中my_center组件，该组件是Ext.tab.Panel组件
                                        //			var tabPanel = Ext.getCmp('my_center');
                                        //var frame = Ext.getDom('mainFrame');
                                        // 如果页面上没有该图书id对应的组件
                                        //alert(!Ext.getCmp(record.data.id));
                                        //if(!Ext.getCmp(record.data.id))
                                        //{
                                        // 向Ext.tab.Panel组件中插入一个新的Tab页面
                                        // 主显示区
                                        var tabpanel = Ext.getCmp('Main_MasterPage_TabMain');
                                        if(tabpanel.items.getCount()>=10){//tab最多限制10个
                                            Ext.Msg.alert('提示', "系统最多允许打开10个tab窗体，请关闭其他窗体再打开！");
                                            return;
                                        }
                                        var n = tabpanel.getComponent(record.data.id);
                                        if (!n) {
                                            n = tabpanel.add({
                                                id: record.data.id,
                                                title: record.data.text,
                                                closable: true,
                                                html: '<iframe id="reporter-iframe" src="' + record.data.url + '" frameborder="0" scrolling="auto"  width="100%" height="100%" style="height:560px;width:100%;overflow-y:auto;" ></iframe>'
                                            });
                                            tabpanel.setActiveTab(n);
                                        } else {
                                            tabpanel.setActiveTab(n);
                                        }
                                        // alert(tabpanel.items.getCount());

                                        /* var tab = tabPanel.add(
                                         {
                                         // 设置新Tab页面的属性
                                         id:record.data.id,
                                         title: record.data.text,
                                         frame:true,
                                         closable:true,
                                         contentEl:'mainFrame'
                                         //		items:[Cmp]
                                         }
                                         ); */
                                        //}
                                        //	tab.doLayout();
                                        // 激活正在查看的功能页
                                        //		tabPanel.setActiveTab(record.data.id);
                                        // 向下边区域的Ext.panel.Panel组件中插入内容
                                        /* 	Ext.getCmp('info').add({html:'正在进行'
                                         + record.data.text + '操作'}); */
                                    }
                                }

                            },
                            width: 200,
                            store: store,
                            rootVisible: false,
                            collapsible: true,
                            split: true

                        },
                        // 下边区域的内容，使用一个普通Ext.panel.Panel
                        // 没有指定xtype，默认是Ext.panel.Panel
                        /* {
                         id:'info',
                         region: 'south',
                         title: '操作信息',
                         collapsible: true,
                         split: true,
                         height: 100,
                         minHeight: 100
                         }, */
                        // 右边区域的内容，使用一个普通的Ext.panel.Panel
                        /* 	{
                         region: 'east',
                         title: '公告栏',
                         collapsible: true,
                         split: true,
                         width: 200
                         },
                         */
                        // 中间面板的内容：使用一个Ext.tab.Panel
                        {
                            region: 'center',
                            id:'my_center',
                            xtype: 'tabpanel',
                            activeTab: 0,
                            frame:true,
                            //contentEl:tabpanel,
                            //items:tabpanel,
                            id: "Main_MasterPage_TabMain",
                            //region: "center",
                            autoScroll: true,
                            enableTabScroll: true//如果Tab过多会出现滚动条
                        }

                    ]
                });
        });
	</script>
     <input type="hidden" name="userRealName" id="userRealName" value="<sec:authentication property="name"/>">
	</body>
</html>
