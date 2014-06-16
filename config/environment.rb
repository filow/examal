# Load the Rails application.
require File.expand_path('../application', __FILE__)
SITE_NAME="在线考试系统"

NAVS=[
	{icon: "home",text:"首  页", controller: "admin",children: [
		{icon: "dashboard", text: "仪表盘", action: "index"}
		]},
	{icon: "male", text: "教师管理", controller: "teachers",children: [
		{icon: "info" , text:"教师信息",action:"index"}
		]}
]
# Initialize the Rails application.
Rails.application.initialize!
