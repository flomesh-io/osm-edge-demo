# osm-edge演示

# 1.先决条件

一个运行中的 Kubernetes 集群，如无，可以选择安装kind集群

## 1.kind集群

### 1.1安装

```
make kind-install
```

### 1.2启动

```
make kind-up
```

### 1.3关闭

```
make kind-reset
```

# 2.启动演示环境

## 2.1快速启动

```
make kind-demo
```

## 2.2分步骤启动

### 2.2.1启动k8s集群

```
make kind-up
```

### 2.2.2安装演示环境

```
make demo-up
```

# 3.对外开放演示环境

```
make demo-forward
```

# 4.环境卸载

## 4.1卸载演示环境

```
make demo-reset
```

## 4.2关闭k8s集群

```
make kind-reset
```

