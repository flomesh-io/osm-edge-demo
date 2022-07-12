# osm-edge-demo

This repository contains a set of scripts and samples to be used in [osm-edge](https://github.com/flomesh-io/osm-edge) mesh.
# 1. Pre-requisites

A running **Kubernetes** cluster (accessible via `kubectl`). If you don't have cluster accessible, you can proceed with instructions in section 1 on setting up **kind** cluster.

## 1.kind cluster

 This section describes the commands which can be used to setup a **kind** cluster on your local machine.

### 1.1 Setup

```
make kind-install
```

### 1.2 Starting cluster
```
make kind-up
```

### 1.3 Destroying cluster

```
make kind-reset
```

# 2. Starting demo environment

## 2.1 Quick start

```
make kind-demo
```

## 2.2 Step-by-step instructions

### 2.2.1 Start Kubernetes cluster

```
make kind-up
```

### 2.2.2 Install Samples

```
make demo-up
```

# 3. Exposing sample applications ports

```
make demo-forward
```

# 4. Uninstall

## 4.1 Uninstall demo environment

```
make demo-reset
```

## 4.2 Destroying Local Kubernetes kind cluster

```
make kind-reset
```

