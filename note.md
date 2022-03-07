# note

命令记录:

```bash
npm install -g lerna

mkdir monorepo-lerna && cd monorepo-lerna
git init
npm init -y
tsc --init
lerna init --independent

npm i

gi node > .gitignore

# 也可以交互式创建： lerna create simple-nlp
mkdir packages/simple-nlp packages/simple-service
cd packages/simple-nlp && npm init -y && cd -
cd packages/simple-service && npm init -y && cd -

# lerna exec "cp ../../.gitignore ."

lerna add typescript --dev
lerna add natural packages/simple-nlp
lerna add @types/natural packages/simple-nlp

# 编写子项目的 tsconfig.json
# 增加子项目的 package.json, 加入 scripts tsc:tsc
# lerna run tsc # 编译所有子项目

# 编写simple-nlp逻辑

# 编写simple-service占位逻辑

# push to remote

lerna version # 应没有报错，交互方式更新本地子项目version

# 确保已经 npm login, 可以 `npm who am i` 测试，未登录要 `npm adduser`


# 确保代码已经提交
lerna publish 

npm run publish # root项目增加 "publish": "lerna run tsc && lerna publish"

# linking packages
lerna add mw-simple-nlp --scope=mw-simple-service

```
