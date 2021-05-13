# Tomcat Filter 内存马

1. 上传meta.jsp并访问之：

![image](https://github.com/metaStor/Filter_MemShell/blob/main/example/1.png)

2. 会生成 http://xxx/favico.ico 内存马，客户端版本 behinder3.0.7 以上，密码是：meta

![image](https://github.com/metaStor/Filter_MemShell/blob/main/example/2.png)


访问完成之后，自行删除上传的meta.jsp
采用反射来适配不同环境下的tomcat环境，适配范围：Tomcat 7~9