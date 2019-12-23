#### 华夏银行

- template-java-build-deploy-custom-registry.yaml
fork 自 [fusion-stage-pipeline](https://bitbucket.org/mathildetech/fusion-stage-pipeline)，构建镜像的步骤由上传镜像到绑定的仓库改为使用 curl 上传到 fusionstage。

- template-robotframework

配置:
1. Jenkins
Manage Jenkins > configuration > Pod Templates 中，添加一个 pod，参数:
其它参数默认
```
Name: robotframework
Labels: robotframework
Containers.Name: robotframework
Containers.Docker image: dwgao/robotframework
```

全局环境变量设置
Manage Jenkins > configuration > Global properties
```
REPORT_SERVER_TOKEN=yourtoken
REPORT_SERVER=192.168.1.1
REPORT_SERVER_PORT=12345
REPORT_SERVER_WEB_PORT=34567
```

2. 制品服务器为了能把 robotframework 测试报告文件上传到制品服务器上，我们需要在slave集群把该服务启动，参考的命令如下：
```shell
docker run -d -p 12345:25478 -v /report:/var/root index.alauda.cn/alaudak8s/simple-server:times app -token yourtoken -upload_limit 52428800 /var/root
```

注意⚠️，请记住这时候设置的令牌和端口，后面的步骤中会用到。

3. 为了能够让用户通过浏览器能够访问测试报告页面，还需要在slave集群启动下面的服务：
```shell
docker run -d -p 34567:80 -v /report:/usr/share/nginx/html/ nginx
```

测试仓库可以使用 [robot-demo](https://bitbucket.org/mathildetech/robotframework-docker/src/master/robot-demo/)