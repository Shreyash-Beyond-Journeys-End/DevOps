# Kubernetes Volumes

This document explains different types of storage available in Kubernetes and how they work. I have included practical examples for each concept to make it easy to understand.

## 1. emptyDir

An `emptyDir` volume is created when a Pod is assigned to a Node. As the name says, it is initially empty. All containers in the Pod can read and write to this volume. When a Pod is removed from a node, the data in the `emptyDir` is erased forever. It's best for temporary data or sharing files between containers in the same pod.

**Example:**
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: emptydir-example
spec:
  containers:
  - name: my-container
    image: nginx
    volumeMounts:
    - mountPath: /cache
      name: cache-volume
  volumes:
  - name: cache-volume
    emptyDir: {}
```

## 2. hostPath

A `hostPath` volume mounts a file or directory from the host node's filesystem into your Pod. This means the data stays on the node even if the pod dies. However, if the pod gets scheduled on a different node next time, it won't see the same data.

**Example:**
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: hostpath-example
spec:
  containers:
  - name: my-container
    image: nginx
    volumeMounts:
    - mountPath: /test-pd
      name: test-volume
  volumes:
  - name: test-volume
    hostPath:
      path: /data/test
      type: DirectoryOrCreate
```

## 3. PersistentVolume (PV)

A PersistentVolume (PV) is a piece of storage in the cluster that has been provisioned by an administrator or dynamically provisioned. It is a resource in the cluster just like a node is a cluster resource. PVs exist independently of any individual Pod that uses the PV.

**Example:**
```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-example
spec:
  capacity:
    storage: 1Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: "/mnt/data"
```

## 4. PersistentVolumeClaim (PVC)

A PersistentVolumeClaim (PVC) is a request for storage by a user. It is similar to a Pod. Pods consume node resources and PVCs consume PV resources. Pods can request specific levels of resources (CPU and Memory). Claims can request specific size and access modes.

**Example:**
```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: pvc-example
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 500Mi
```

## 5. StorageClass

A StorageClass provides a way for administrators to describe the "classes" of storage they offer. Different classes might map to quality-of-service levels, or to backup policies, or to arbitrary policies determined by the cluster administrators. It helps in dynamic provisioning.

**Example:**
```yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: fast-storage
provisioner: k8s.io/minikube-hostpath
```

## 6. Dynamic Provisioning

Dynamic volume provisioning allows storage volumes to be created on-demand. Without dynamic provisioning, cluster administrators have to manually make calls to their cloud or storage provider to create new storage volumes, and then create PV objects to represent them in Kubernetes. With dynamic provisioning, when a user creates a PVC, the StorageClass automatically creates the PV for them.

**Example:**
You just need a `StorageClass` and a `PVC`. The PV is created automatically!
```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: dynamic-pvc
spec:
  storageClassName: fast-storage # Refers to the StorageClass
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
```
