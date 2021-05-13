# Tomcat Filter 内存马

1. 上传meta.jsp并访问之：

![image](https://github.com/metaStor/Filter_MemShell/blob/main/example/1.png)

2. 会生成 http://xxx/favico.ico 内存马，客户端版本 behinder3.0.7 以上，密码是：meta

![image](https://github.com/metaStor/Filter_MemShell/blob/main/example/2.png)




## 特征

* 节省了以往先上传webshell再注入内存马的步骤，一步到位
* 一定条件下，可以用于冰歇jsp马被杀传不上的情况
* 采用反射来适配不同环境下的tomcat环境，适配范围：Tomcat 7~9
* 得益于filter的原理，`不需要路径真实存在`
* 代码只在web层实现了自删除，但物理层还是需要自行删除上传的 meta.jsp


## TODO

weblogic 环境的注入