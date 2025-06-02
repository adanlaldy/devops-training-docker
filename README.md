# Adan Laldy

## 3.a 
### commande :
```
sudo docker pull httpd
```
### sortie : 
```
Using default tag: latest
latest: Pulling from library/httpd
61320b01ae5e: Pull complete 
be60498bea0a: Pull complete 
4f4fb700ef54: Pull complete 
8f86928406fd: Pull complete 
162ef2c73af1: Pull complete 
8dbbd44856ed: Pull complete 
Digest: sha256:09cb4b94edaaa796522c545328b62e9a0db60315c7be9f2b4e02204919926405
Status: Downloaded newer image for httpd:latest
docker.io/library/httpd:latest
```

## 3.b 
### commande :
```
sudo docker images
```
### sortie : 
```
REPOSITORY   TAG       IMAGE ID       CREATED        SIZE
httpd        latest    958373fdd7e8   4 months ago   148MB
```

## 3.d
### commande :
```
sudo docker run --name hello-world -d -p 80:80 -v /home/nada/WebstormProjects/devops-training-docker/html/:/usr/local/apache2/htdocs/:Z httpd
```
### sortie : 
```
204f30780991434c707cb89da9b198775f8f146330b0221e9a7d71b44bf112e4
```