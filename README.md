# Docker image for CI/CD and Lambda (0.4.0)

## Versions

- Debian: 10.10 (Buster)
- nodejs: 14.17.3
- yarn: 3.0.0
- npm: 7.20.2
- aws-lambda-rie: 1.1.0
- puppeteer: 10.1.0
- serverless: 2.52.1
- Google Chrome: 92.0.4515.107
- python: 2.7.16
- python3: 3.7.3
- pip3: 18.1
- aws cli: 1.20.9
- java (openjdk): 11.0.11 (2021-04-20)
- JAVA_HOME: /usr/lib/jvm/java-11-openjdk-amd64/

## Docker Pull Command

```bash
docker pull evheniy/node-build:0.4.0
```

## Dockerfile

```docker
FROM evheniy/node-build:0.4.0
...
```

## Jenkinsfile

```groovy
pipeline {
  agent {
    docker {
      image 'evheniy/node-build:0.4.0'
      args '-v /yarn_cache:/yarn_cache'
    }
  }
  ...
}
```
