# Task 3

- Your application team is developing an application that uses different Docker images to test developers' code. So far, the images have been built on every server locally. The application team has asked you to deploy a Docker image registry on Kubernetes, which will be storing Docker images used by their application in future.

## Your task

Write a Kubernetes object according to the expectations listed below:

- Docker images registry will be deployed as a `single replica`;

- Pod runs a single container with image `registry:2.7.1`;

- Container stores images under `/var/lib/registry`. Mount a Persistent Volume to store data;

- Additional configuration for the Persistent Volume:
    - Set access modes to ReadWriteOnce;
    - Persistent Volume should request `100Gi` storage size;

- The container exposes port `5000`;

- The container must have configured a `LivenessProbe`, which will attempt to open a socket to your container on `port 5000 (use tcpSocket)`;
    - Additional configurations on the LivenessProbe:
        - Set initial probe delay to `10 seconds`;

- The container must have configured a `ReadinessProbe`, which will attempt to open a socket to your container on `port 5000 (use tcpSocket)`;
    - Additional configurations on the ReadinessProbe:
        - Set initial probe delay to `10 seconds`;

- Additionally, write a Service with `type LoadBalancer`, which exposes the above deployment on `port 5000`.

## For this test, assume that:

- You will use either StatefulSet or Deployment object definition from apiGroup apps/v1 to deploy the application;
- If necessary, you may use PersistentVolumeClaim from apiGroup v1;
- You can use tcpSocket requests in probes;
- The resources will be created in the default namespace (it is not expected to define its own namespace);
- Your solution will be applied using kubectl apply -n default -f <name of the file>.yaml for each .yaml file in the directory;
- The files you are editing must be written as a valid YAML file;
- The resources will be deployed on Kubernetes v1.16;
- The solution may be written in one or multiple files. The names of the files do not matter. If using a single file ensure you are separating YAML documents correctly.












