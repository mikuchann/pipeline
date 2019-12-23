#### 华夏银行

- template-java-build-deploy-custom-registry.yaml
fork 自 [fusion-stage-pipeline](https://bitbucket.org/mathildetech/fusion-stage-pipeline)，构建镜像的步骤由上传镜像到绑定的仓库改为使用 curl 上传到 fusionstage。

- template-robotframework

配置:
在 jenkins > configuration > Pod Templates 中，添加一个 pod，参数:
```
Name: robotframework
Labels: robotframework
Containers.Name: robotframework
Containers.Docker image: dwgao/robotframework

其它参数默认
```