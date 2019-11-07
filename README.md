# springboot-kubernetes

将springboot 项目部署到kubernetes 上

宿主机使用工作用的ArchLinux 系统，Vbox 在平时使用中，已经默认安装

需要额外安装的是minkube, kubectl 

在AUR中有community/minikube , aur/minikube-bin-aliyun 

使用community/minkube 会在启动后，安装gcr源上的包，抛出链接异常

在不无VPN, 不想慢慢看如何配置proxy 的情况下，换成安装minikube-bin-aliyun 

minikube 在使用过程中会在~/下面创建.minikube 目录，如果不是新安装，在以前使用过，并抛出过错误

建议直接将该目录删除，重新执行minkube start 创建virtual machine 并自动部署需要的kubernetes 服务

在minkube start 不出现问题的情况下，就可以执行minkube dashborad 打开控制面板，查看服务状态

在宿主机器上直接通过mvn dockerfile:build 的方式，会将docker image 直接写入到宿主机的docker images 中

然后通过kubectl 发布引用程序会因为找不到容器镜像而失败

所以在mvn dockerfile:build 之前需要通过eval ```$(minikube docker-env) ``` ，　通过evel $(minikube docker-env) 切换为minikube 中的docker 

然后再执行mvn dockerfile:build 就会直接将image build 到minikube 中的docker images 

