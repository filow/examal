# Load the Rails application.
require File.expand_path('../application', __FILE__)
SITE_NAME="在线考试系统"
START_TIME=Time.now
NAVS=[
	{icon: "home",text:"首  页", controller: "admin",children: [
		{icon: "dashboard", text: "仪表盘", action: "index"}
		]},
	{icon: "group", text: "学生管理", controller: "students",children: [
		{icon: "list" , text:"学生列表",action:"index"}
		]},
	{icon: "male", text: "教师管理", controller: "teachers",children: [
		{icon: "info" , text:"教师信息",action:"index"}
		]},
	{icon: "database", text: "题库管理", controller: "questions",children: [
		{icon: "list" , text:"题库列表",action:"index"}
		]},
	{icon: "university", text: "考试管理", controller: "exams",children: [
		{icon: "list" , text:"考试列表",action:"index"}
		]}
]
# Initialize the Rails application.
Rails.application.initialize!
