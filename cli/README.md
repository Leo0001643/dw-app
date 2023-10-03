A simple command-line application.


1. install 安装
   
working directory in repo root

在repo根目录中运行

```shell
dart pub global activate --source path ./cli  
```

   
2. add environment variable 添加环境变量

> You can skip this step if you added before
> 
> 跳过这一步如果你已经添加过了

```text
unix*
export $HOME/.pub-cache/bin

Windows*
%LOCALAPPDATA%\Pub\Cache\bin
```

3. run 运行

```shell
cli-dev  (dev)
```