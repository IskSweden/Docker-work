# Inhalt

IaC Lernumgebung für den Umgang mit

* **Docker Images**
* **Docker Container**
  * *Container Volume*
  * *Container Port*

---

## Vagrant Definition

Vagrant Definition mit folgenden Eigenschaften

* Ubuntu Jammy64
* Portforwarding
  * 80:8080
  * 8081:8081
  * 8082:8082
  * 8083:8083
  * 3306:3306
  * Range 32760:32760 bis 32780:32780
* Docker & Docker-Compose
* Shared Folder `.`,`/mnt`
  
SSH-Public Key kann in [`scripts/add_ssh_pub.sh`](scripts/add_ssh_pub.sh) hinterlegt werden.

> Wie sie die Umgebung mit ssh-public Key einrichten wurde [hier](https://github.com/mbe99/docker-phpmyadmin) beschrieben. 

---


## Registry

### Gitlab Container Registry

Registry: https://gitlab.com/mbe99/docker-work/container_registry


> **Docker Hub** hat eine **Downloads Limitation von 100 Images pro IP innerhalb 6h** (angemeldet sind es 200). Das Limit wird im Schulumfeld schnell erreicht. Die nachfolgenden Übungen beziehen die Images von der [Gitlab Registry](https://gitlab.com/mbe99/docker-work/container_registry).  Alles verwendeten Images wurden ursprünglich von [hub.docker.com](https://hub.docker.com) bezogen, getagged und anschliessend in die  Registry von [Gitlab](https://gitlab.com) gespeichert. Deshalb haben diese Images das Präfix   `registry.gitlab.com/mbe99/docker-work/` vor den Image Name.


### Docker Hub

`docker pull debian:stretch-slim`

`docker run debian:stretch-slim`


### Gitlab

`docker pull registry.gitlab.com/mbe99/docker-work/debian:stretch-slim`

`docker run registry.gitlab.com/mbe99/docker-work/debian:stretch-slim`

# Übungen

- [ ] [Docker Images](transscript-images.md)
- [ ] [Docker run, volume, port](transscript-run-volume-port.md)






