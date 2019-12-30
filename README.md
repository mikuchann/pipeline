## C/C++ 构建


### template-cpp 配置:

#### 1.Jenkins
Manage Jenkins > configuration > Pod Templates 中，添加一个 pod，参数:
其它参数默认
```
Name: cpp
Labels: cpp
Pod template to inherit from: base
Containers.Name: cpp
Containers.Docker image: sglim2/centos7
```