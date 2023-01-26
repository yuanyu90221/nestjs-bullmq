# nestjs-bullmq

This is demo project for nestjs use bullmq to acheving Scale in Nodejs

## create project with nest cli

```shell
nest new nestjs-bullmq
```

## install bullmq related package

```shell
yarn add @nestjs/bull bull
yarn add -D @types/bull
```

## start development mode

```shell
yarn start dev
```

## build up with k8s helm

```shell
cd k8s/nestjs-bullmq
helm install nestjs-bullmq .
```
## remove from k8s 
```shell
cd k8s/nestjs-bullmq
helm uninstall nestjs-bullmq 
```