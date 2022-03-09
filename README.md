# monorepo-lerna

演示通过 lerna 实现 monorepo，包括 2 个 package 项目。

## 发布

前提：已经全局安装 `lerna`

在此项目中有 2 个 package：

```bash
$ lerna list
lerna notice cli v4.0.0
lerna info versioning independent
mw-simple-nlp
mw-simple-service
lerna success found 2 packages
```

安装各个 package 的依赖包，以及它们之间的依赖：

```bash
$ lerna bootstrap
lerna notice cli v4.0.0
lerna info versioning independent
lerna info Bootstrapping 2 packages
lerna info Installing external dependencies
lerna info Symlinking packages and binaries
lerna success Bootstrapped 2 packages
```

修改某个 package 后，git 提交代码，否则无法执行发布流程。

发布：

```bash
$ npm run publish
```

将会交互方式设置 package 新版本，然后发布到 npm 上。

列出当前测试环境信息:

```bash
$ lerna info
lerna notice cli v4.0.0
lerna info versioning independent

 Environment info:

  System:
    OS: macOS 12.0.1
    CPU: (8) x64 Intel(R) Core(TM) i5-8259U CPU @ 2.30GHz
  Binaries:
    Node: 16.14.0 - ~/.nvm/versions/node/v16.14.0/bin/node
    Yarn: 1.22.17 - ~/.nvm/versions/node/v16.14.0/bin/yarn
    npm: 8.3.1 - ~/.nvm/versions/node/v16.14.0/bin/npm
  Utilities:
    Git: 2.30.0 - /usr/local/bin/git
```

## 使用

```bash
# 安装 mw-simple-service
$ npm i mw-simple-service --global

# 启动
$ mw-simple-service

# 测试服务是否正常使用
$ curl -d '{"content":"Last week I went to the theatre. I had a very good seat. The play was very interesting. I did not enjoy it. A young man and a young woman were sitting behind me. "}' -H "Content-Type: application/json" -X POST http://localhost:3000

{"lines":["Last week I went to the theatre.","I had a very good seat.","The play was very interesting.","I did not enjoy it.","A young man and a young woman were sitting behind me."]}
```

