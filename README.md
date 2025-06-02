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

## 4.b
### commande : 
```
sudo docker run -d -p 8080:80 --name mon-conteneur my-image
```
### sortie : 
```
4b8eafee9f26f44395cf654f027fc0628320e2664ab35be8b980b65a8ec33dcb
```

## 4.c
Dans la question 3, on utilisait -v avec le chemin absolu de ou se trouvait l'index.html et on précisait l'endroit ou ça devait pointer sur le conteneur. Tout cela dans la commande de run.

Mount volume permet d'avoir quelque chose qui tient sur une ligne, mais difficilement lisible.

COPY dans le Dockerfile permet de faire la même chose, mais d'avoir quelque chose de plus structuré, qui est plus facilement lisible et modifiable.

## 5.a
### commande :
```
sudo docker pull mysql
```
### sortie : 
```
Using default tag: latest
latest: Pulling from library/mysql
9845df06f911: Pull complete 
4bd1fb59dd90: Pull complete 
d23320eed97a: Pull complete 
7074f55c9a02: Pull complete 
72ac912b8a2e: Pull complete 
b097427f1ebe: Pull complete 
b288ccce2510: Pull complete 
7488ffd7127f: Pull complete 
8a50ff4ab30c: Pull complete 
5056ce4ab875: Pull complete 
Digest: sha256:04768cb63395f56140b4e92cad7c8d9f48dfa181075316e955da75aadca8a7cd
Status: Downloaded newer image for mysql:latest
docker.io/library/mysql:latest
```
### commande : 
```
sudo docker pull phpmyadmin/phpmyadmin
```
### sortie : 
```
Using default tag: latest
latest: Pulling from phpmyadmin/phpmyadmin
af302e5c37e9: Pull complete 
71a74ed03dab: Pull complete 
3ef8d0774deb: Pull complete 
11d17388a3b8: Pull complete 
0814cbbf72a2: Pull complete 
3a28acedadf8: Pull complete 
2ab7ef40feaf: Pull complete 
88324ccb20a1: Pull complete 
ad5f2fca9132: Pull complete 
9df2a6231627: Pull complete 
b3207e60ff9a: Pull complete 
d18c9f420b35: Pull complete 
673faad72ba8: Pull complete 
4f4fb700ef54: Pull complete 
a5c74661bb9e: Pull complete 
1cf5cbfd971f: Pull complete 
e92d8472eb26: Pull complete 
7755344c0dda: Pull complete 
b0f9dd503cef: Pull complete 
2ee0fe041682: Pull complete 
Digest: sha256:95e01f723b5e55fabf16d0473f1df2354c4c6352b35902b51d6a6245e074aee4
Status: Downloaded newer image for phpmyadmin/phpmyadmin:latest
docker.io/phpmyadmin/phpmyadmin:latest
```
### commande : 
```
sudo docker run --name phpmyadmin -d -e PMA_HOST=mysql -p 5432:80 phpmyadmin/phpmyadmin
```
### sortie :
```
6cc0a2c325f46f4f4b0ba403acf16d872daf559ced287f5667cffb5f5076ca61
```
### commande : 
```
sudo docker run --name mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql
```
### sortie : 
```
e28addd19108318a2ceee92e32d96edbb6dad2fdafc97832ed4564ba346be54f
```
### commande : 
```
sudo docker network create my-net
```
### sortie :
```
7e2668f6a26a2b34857ee3893ab8023791ac83847a8d5d3238a6b08260074c80
```
### commandes : 
```
sudo docker network connect my-net mysql
sudo docker network connect my-net phpmyadmin
```
### screenshot : 
![Screenshot](/assets/images/phpmyadmin.png "Screenshot")

## 6.a
Docker-compose lit une configuration d'un fichier YAML.
Docker run est une commande basée sur une ligne de commande.
Docker-compose peut configurer et lancer plusieurs conteneurs alors que docker run seulement un à la fois.