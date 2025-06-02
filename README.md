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
(j'ai du rajouter :Z afin de donner un contexte SELinux adapté afin de donner les bons droits aux fichiers, sinon, j'avais une erreur 403 Forbidden)
```
sudo docker run --name hello-world -d -p 80:80 -v /home/nada/WebstormProjects/devops-training-docker/html/:/usr/local/apache2/htdocs/:Z httpd
```
### sortie : 
```
204f30780991434c707cb89da9b198775f8f146330b0221e9a7d71b44bf112e4
```

## 3.e
### commande :
```
sudo docker ps
```
### sortie :
```
CONTAINER ID   IMAGE     COMMAND              CREATED         STATUS         PORTS                               NAMES
204f30780991   httpd     "httpd-foreground"   3 minutes ago   Up 3 minutes   0.0.0.0:80->80/tcp, :::80->80/tcp   hello-world
```
### commande : 
```
sudo docker stop 20
```
### sortie :
```
20
```
### commande :
```
sudo docker rm 20
```
### sortie :
```
20
```

## 3.f 
### commande : 
```
sudo docker cp /home/nada/WebstormProjects/devops-training-docker/html/index.html hello-world:/usr/local/apache2/htdocs/index.html
```
### sortie : 
```
Successfully copied 2.05kB to hello-world:/usr/local/apache2/htdocs/index.html
```

## 4.a
### commande :
```
sudo docker build -t my-image .
```
### sortie : 
```
[+] Building 0.2s (7/7) FINISHED                                                                                                                                                                                     docker:default
 => [internal] load build definition from Dockerfile                                                                                                                                                                           0.0s
 => => transferring dockerfile: 184B                                                                                                                                                                                           0.0s
 => [internal] load metadata for docker.io/library/httpd:latest                                                                                                                                                                0.0s
 => [internal] load .dockerignore                                                                                                                                                                                              0.0s
 => => transferring context: 2B                                                                                                                                                                                                0.0s
 => [internal] load build context                                                                                                                                                                                              0.0s
 => => transferring context: 202B                                                                                                                                                                                              0.0s
 => [1/2] FROM docker.io/library/httpd:latest                                                                                                                                                                                  0.0s
 => CACHED [2/2] COPY /html/ /usr/local/apache2/htdocs/                                                                                                                                                                        0.0s
 => exporting to image                                                                                                                                                                                                         0.0s
 => => exporting layers                                                                                                                                                                                                        0.0s
 => => writing image sha256:8f5a213bde5adb14ad313ef71517957e39b8326391f4d947a31230eaa088ffc0                                                                                                                                   0.0s
 => => naming to docker.io/library/my-image
```