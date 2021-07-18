# Docker image for CI/CD and Lambda (0.3.9)

## Versions

- Debian: 10.10 (Buster)
- nodejs: 14.17.3
- yarn: 1.22.5
- npm: 7.20.0
- aws-lambda-rie: 1.1.0
- lerna: 4.0.0
- puppeteer: 10.1.0
- serverless: 2.52.0
- Google Chrome: 91.0.4472.164
- python: 2.7.16
- python3: 3.7.3
- pip3: 18.1
- aws cli: 1.20.1
- java (openjdk): 11.0.11 (2021-04-20)
- JAVA_HOME: /usr/lib/jvm/java-11-openjdk-amd64/

## Docker Pull Command

```bash
docker pull evheniy/node-build:0.3.9
```

## Dockerfile

```docker
FROM evheniy/node-build:0.3.9
...
```

## Jenkinsfile

```groovy
pipeline {
  agent {
    docker {
      image 'evheniy/node-build:0.3.9'
      args '-v /yarn_cache:/yarn_cache'
    }
  }
  ...
}
```
