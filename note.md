# note

命令记录:

```bash
mkdir monorepo-lerna && cd monorepo-lerna
git init
npm init -y
lerna init --independent

npm i

gi node > .gitignore

mkdir packages/simple-nlp packages/simple-service
cd packages/simple-nlp && npm init -y && cd -
cd packages/simple-service && npm init -y && cd -

# lerna exec "cp ../../.gitignore ."

lerna add typescript --dev
lerna add @types/natural packages/simple-nlp

# 编写simple-nlp逻辑

# 编写simple-service占位逻辑

# push to remote 

```
