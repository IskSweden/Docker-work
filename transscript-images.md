# Transscript - 01 Docker Images



## Docker Hub

https://hub.docker.com

- [ ] Images suchen: *mariadb*
- [ ] Verschiedene Tags zu *mariadb*

---

## Docker CLI

### Hilfe erhalten
- [ ] `$ docker --help`
- [ ] `$ docker image --help`

### Vorhandene Images listen

- [ ] $ `docker image ls`
- [ ] $ `docker images`


### Image `busybox` in der *latest* Version pullen

- [ ] `$ docker pull registry.gitlab.com/mbe99/docker-work/busybox`
- [ ] `$ docker images`

### `busybox` Image in der *Alpine* Version `musl` pullen

- [ ] `$ docker pull registry.gitlab.com/mbe99/docker-work/busybox:musl`
- [ ] `$ docker images`

## Image debuggen

### Image History (layer)

- [ ] `$ docker image history registry.gitlab.com/mbe99/docker-work/busybox:musl`


Was zeigt dieser Output?

<details><summary>Antwort</summary>
 	Die Image Layer
</p></details> <br>

### Image inspect

- [ ] `$ docker image inspect registry.gitlab.com/mbe99/docker-work/busybox:musl`

### Wo sind die Images und Container auf dem Hostsystem abgelegt?

- [ ] `$ ls -l /var/lib/docker/image`


### Ein Image löschen

- [ ] `$ docker images`
- [ ] `$ docker rmi registry.gitlab.com/mbe99/docker-work/busybox:musl`


### Nur ID der Images listen

- [ ] Pullen sie nachfolgende Images
```
$ docker pull registry.gitlab.com/mbe99/docker-work/busybox:stable-musl
$ docker pull registry.gitlab.com/mbe99/docker-work/busybox:musl
$ docker pull registry.gitlab.com/mbe99/docker-work/busybox:1.35.0-musl
$ docker pull registry.gitlab.com/mbe99/docker-work/busybox:1.34-musl
```

- [ ] `$ docker images -q`

> **TIP:** Images wie auch Container besitzen immer eindeutige IDs. Anstelle von Image- oder Container Name kann auch die ID verwendet werden. Das ist insbesondere bei Automatisation mit Scripten viel praktischer.

### Weshalb hat es zweimal dieselbe Image ID?

- [ ] `$ docker images`

<details><summary>Antwort</summary>
 	Weil beide Images auf demselben Baseimage basieren, nur der Tag ist unterschiedlich
</p></details>

### Image Tag setzen

- [ ] `$ docker image tag registry.gitlab.com/mbe99/docker-work/busybox:stable-musl busybox:tbz`
- [ ] `$ docker images`

### Alle vorhandenen Images löschen

- [ ] `$ docker images -q`
- [ ] `$ docker rmi $(docker images -q)`

Nicht funktioniert?

- [ ] `$ docker images -q`

weshalb der Fehler?

<details><summary>Antwort</summary>
 	Weil das busybox:stable-musl zum busybox:musl und busybox:tbz (tag) referenziert ist (gleiches Image)
</p></details><br>

- [ ] `$ docker rmi busybox:tbz`
- [ ] `$ docker rmi registry.gitlab.com/mbe99/docker-work/busybox:musl`
- [ ] `$ docker rmi $(docker images -q)`
- [ ] `$ docker images`

## Images importieren und exportieren

### Image aus lokaler Registry als TAR-File sichern

- [ ] `$ docker pull registry.gitlab.com/mbe99/docker-work/busybox:1.34-musl`
- [ ] `$ docker save registry.gitlab.com/mbe99/docker-work/busybox:1.34-musl -o busybox.1.34-musl.tar`
- [ ] `$ ls -l`
- [ ] `$ docker rmi registry.gitlab.com/mbe99/docker-work/busybox:1.34-musl`
- [ ] `$ docker images`

### Image aus TAR-File in lokale Registry laden

- [ ] `$ docker load -i busybox.1.34-musl.tar`
- [ ] `$ docker images`

Wozu ist das gut?   

<details><summary>Antwort</summary>
 	Wenn es keinen Zugang zum Internet (disconnected Environment) gibt
</p></details><br>


[zurück](README.md)