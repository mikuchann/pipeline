project=$(git symbolic-ref HEAD | sed 's!refs\/heads\/!!')
echo "打包项目 $project 中..."
zip -r $project-pipeline-templates.zip definition
echo "项目 $project 模板打包完成，文件: $project-pipeline-templates.zip"