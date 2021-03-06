<#assign url = "http://127.0.0.1:8080">
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${webConfig.title}</title>
    <meta name="keywords" content="${webConfig.keywords}">
    <meta name="description" content="${webConfig.description}">

    <!-- pace -->
    <script src="${webConfig.domainName}/static/plugins/pace-0.7.5/pace.js"></script>
    <link href="${webConfig.domainName}/static/plugins/pace-0.7.5/themes/blue/pace-theme-center-circle.css" rel="stylesheet"/>

    <!-- Bootstrap -->
    <link href="${webConfig.domainName}/views/TeaCMS/assets/bootstrap3/css/bootstrap.css" rel="stylesheet"/>

    <link rel="stylesheet" href="${webConfig.domainName}/views/TeaCMS/assets/get-shit-done/css/gsdk.css"/>
    <link rel="stylesheet" href="${webConfig.domainName}/views/TeaCMS/assets/get-shit-done/css/demo.css"/>
    <link rel="stylesheet" href="${webConfig.domainName}/views/TeaCMS/css/new-style.css"/>

    <!--     Font Awesome     -->
    <link href="/views/TeaCMS/assets/bootstrap3/css/font-awesome.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Grand+Hotel' rel='stylesheet' type='text/css'>

    <style>
        .text {
            line-height: 24px;
            padding-left: 4px;
            text-align: justify;
            word-wrap: break-word;
            overflow: hidden;
        }
    </style>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<#include "lib/header.ftl">

<#include "lib/banner.ftl">

<div class="container teacms-article-main">
    <div class="col-md-8 col-xs-12">
    <#list articlePage.list as item>
        <div class="teacms-article-list">
            <div class="teacms-article-img">
                <a href="${webConfig.domainName}/${item.id}.html">
                    <img src="${item.articleImg}" alt="" class="img-responsive img-thumbnail"/>
                </a>
            </div>
            <div class="teacms-article-content">
                <div class="teacms-article-content-header">
                    <h2><a href="${webConfig.domainName}/${item.id}.html">${item.articleTitle}</a></h2>
                </div>
                <p class="text">
                    <#assign content = item.articleContent?replace("<[^>]*>", "", "r")?replace(" ", "")>
                    <#if content?length &gt; 150>
                    ${content?substring(0, 150)}[...]
                    <#else>
                    ${content}
                    </#if>
                </p>
            </div>
            <div class="clearfix"></div>
            <div class="teacms-article-footer">
					<span class="visible-lg visible-md visible-sm pull-left">
						<a href="#"><i class="fa fa-calendar"></i>${item.updateDate?date}</a>
					</span>
                <span class="pull-left">
                    &nbsp;
						<a href="#"><i class="fa fa-eye"></i> ${item.pageView} views</a>
						<a href="#"><i class="fa fa-thumbs-o-up"></i> ${item.praise} Times</a>
					</span>
                <span class="pull-right">
						<a class="read-more" href="${webConfig.domainName}/${item.id}.html" title="阅读全文">阅读全文
                            <i class="fa fa-chevron-circle-right"></i></a>
					</span>
            </div>
        </div>
    </#list>

        <div class="text-center">
            <ul class="pagination teacms-pagination">
            <#if articlePage.isFirstPage == false><li><a href="${webConfig.domainName}/tag/${alias}/page/${articlePage.prePage}">«</a></li></#if>
            <#list articlePage.navigatepageNums as item>
                <li <#if articlePage.pageNum == item>class="active"</#if>><a href="${webConfig.domainName}/tag/${alias}/page/${item}">${item}</a></li>
            </#list>
            <#if articlePage.isLastPage == false><li><a href="${webConfig.domainName}/tag/${alias}/page/${articlePage.nextPage}">»</a></li></#if>
            </ul>
        </div>

    </div>

    <div class="col-md-4 visible-md visible-lg">

        <div class="panel panel-default teacms-panel-box">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-location-arrow"></i> 分类目录</h3>
            </div>
            <div class="panel-body">
                <form action="/so" method="post">
                    <div class="input-group input-group-md">

                        <input type="text" name="name" class="form-control pull-right" placeholder="搜索文章">

                        <div class="input-group-btn">
                            <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <div class="panel panel-default teacms-panel-box teacms-common">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-location-arrow"></i> 分类目录</h3>
            </div>
            <div class="panel-body">
                <ul class="teacms-list-common">
                <#list allCategory as item>
                    <li><a href="${webConfig.domainName}/category/${item.alias}">${item.name}</a></li>
                </#list>
                </ul>
            </div>
        </div>

        <div class="panel panel-default teacms-panel-box">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-tags"></i> 标签</h3>
            </div>
            <div class="panel-body">
                <div class="teacms-tags">
                <#list allTag as item>
                    <a href="${webConfig.domainName}/tag/${item.alias}">${item.name}</a>
                </#list>
                </div>
            </div>
        </div>

        <div class="panel panel-default teacms-panel-box">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-adn"></i> 腾讯云强力驱动</h3>
            </div>
            <div class="panel-body">
                <a href="">
                    <img src="https://ooo.0o0.ooo/2017/03/14/58c79b8aba931.jpg" alt="" class="img-responsive"/>
                </a>
            </div>
        </div>

    </div>

</div>

<div class="teacms-footer container-fluid">
    <div class="container">
        <p>© 2017 <a href="http://www.teacms.me">TeaCMS</a> &nbsp; <a href="https://git.oschina.net/" target="_blank">码云</a> &nbsp;
            <span>${webConfig.icp}</span></p>
    </div>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${webConfig.domainName}/views/TeaCMS/assets/jquery/jquery-1.10.2.js"></script>
<script src="${webConfig.domainName}/views/TeaCMS/assets/jquery/jquery-ui.custom.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="${webConfig.domainName}/views/TeaCMS/assets/bootstrap3/js/bootstrap.js" type="text/javascript"></script>
<script src="${webConfig.domainName}/views/TeaCMS/assets/get-shit-done/js/gsdk-bootstrapswitch.js"></script>
<script src="${webConfig.domainName}/views/TeaCMS/assets/get-shit-done/js/get-shit-done.js"></script>
</body>
</html>