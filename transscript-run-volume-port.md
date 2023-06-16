# Transscript - 02 Docker `run`, `volume`, `port`

## Run

### Mit `docker run` Image pullen und Container starten

- [ ] `$ docker images`
- [ ] `$ docker run registry.gitlab.com/mbe99/docker-work/hello-world`
- [ ] `$ docker images`

### Container starten und interaktiv `/bin/sh` ausführen

> **Zweite** *ssh-Session* öffnen und Befehle Schritt für Schritt eingeben

|Schritt| SSH-Session 1|  SSH Session 2|Info|
|:--:|:--|:--|:--|
|1| |`$ docker run -it registry.gitlab.com/mbe99/docker-work/busybox /bin/sh` | Es erscheint  `/ #`|
|2||`/ # hostname` | |
|3|`$ docker ps`| |was fällt auf? |
|4| | `/ # exit`| 
|5|`$ docker ps` | | wo ist der Container, was ist passiert?|
|5|`$ docker ps -a` | | 

### Container starten und Linux Kommando  `sleep 5` ausführen

- [ ] `$ docker run registry.gitlab.com/mbe99/docker-work/busybox sleep 5`

### Container nochmals starten, diesmal aber mit der Option `-d` (detatched)

- [ ] `$ docker run -d registry.gitlab.com/mbe99/docker-work/busybox sleep 20`
  > Kommando `docker ps` innerhalb 20 Sec. ausführen!
- [ ] `$ docker ps`  

###  Container starten und mit Option `--name` einen definierten Namen verwenden

- [ ] `$ docker run -it --name box registry.gitlab.com/mbe99/docker-work/busybox`
- [ ] `/ # exit`
- [ ] `$ docker ps -a`

### Beendeter Container mit `docker start` erneut starten

- [ ] `$ docker start box`
- [ ] `$ docker ps`

Was fällt beim Output auf?

<details><summary>Antwort</summary>
 	Der Container besitzt nun den von uns vergebnenen Namen "box" und ist beendet (Exited")
</p></details> <br>

### Interaktionen mit einem laufenden Container

- [ ] `$ docker exec box ls`
- [ ] `$ docker ps`
- [ ] `$ docker exec box /bin/sh`

### Weshalb kommt kein Shell Prompt (/ #) ?

>  `docker exec` erneut ausführen, diesmal aber mit der Option -it (interaktiv)

- [ ] `$ docker exec -it box /bin/sh`
- [ ] `/ # exit`

### Laufender Container stoppen (entweder mit Container ID oder Container Name)

- [ ] `$ docker stop box`
- [ ] `$ docker ps -a`

### Gestoppter Container mit `docker rm` komplett löschen (entweder mit Container ID oder Container Name)

- [ ] `$ docker rm box`
- [ ] `$ docker ps -a`

### Mit Option `--rm` Container so starten, dass dieser beim Beenden des Containers gleichzeitig auch gelöscht wird

- [ ] `$ docker run -it --rm  registry.gitlab.com/mbe99/docker-work/busybox /bin/sh`
- [ ] `/ # exit`
- [ ] `$ docker ps -a`


---

## Ports

### Apache Container starten

- [ ] `$ docker run registry.gitlab.com/mbe99/docker-work/httpd:alpine`

Was sehen sie hier?

<details><summary>Antwort</summary>
 	den Standard Output (stdOut) von Apache, das ist das Log vom Container
</p></details> <br>

Abbrechen und Container stoppen

- [ ] `ctrl/c`


### Apache Container mit Option `-d` (detached) starten

- [ ] `$ docker run -d registry.gitlab.com/mbe99/docker-work/httpd:alpine`

### `docker ps` zeigt, dass der Container intern Port 80 bereitstellt

- [ ] `$ docker ps`

### Port 80 des Containers an das Hostsystem (in diesem Fall die Vagrant VM) weiterleiten

- [ ] `$ docker run -d -p 8081:80 registry.gitlab.com/mbe99/docker-work/httpd:alpine`
- [ ] `$ docker ps`
- [ ] [localhost:8081](http://localhost:8081)

---

## Volumes


### Interaktiv die Shell im Apache Container starten 

- [ ] `$ docker run -it registry.gitlab.com/mbe99/docker-work/httpd:alpine /bin/sh`
- [ ] `cat htdocs/index.html`
- [ ] `/usr/local/apache2 # exit`

### Http Container mit  Option `-v` (volume) starten

Datei `index.html` ausserhalb des Container im Verzeichnis `/mnt` erstellen.

- [ ] `$ echo "index.html ausserhalb des Container" > /mnt/index.html`
- [ ] `$ docker run -d --rm --name apache -v /mnt:/usr/local/apache2/htdocs -p 8082:80 registry.gitlab.com/mbe99/docker-work/httpd:alpine`
- [ ] [localhost:8082](http://localhost:8082)
- [ ] `docker stop apache`

> Der Container wurde mit `--rm` gestartet. Dehalb wird der gesamte Container beim stoppen auch gleich gelöscht.

- [ ] `docker ps`

> Die index.html Datei, welche vom httpd des Containers angezeigt wird, liegt tatsächlich ausserhalb des Containers und bleibt deshalb beim Löschen des Containers erhalten.

<br>

Kann das `index.html` File Windows-Seitig editiert werden?

<details><summary>Antwort</summary>
 	Ja - Das Verzeichnis `/mnt` ist auf dem Hostsystem das Verzeichnis wo sich das Vagrantfile befindet.<br>Sie haben nun ein gemeinsames Verzeichnis von Windows zu Ubuntu-VM und Docker-Container.
</p></details> <br>


> wird der Container mit demselben Volume wieder gestartet, steht auch das `index.html` aus den `/mnt` vom Hostsystem wieder zur Verfügung

- [ ] `$ docker run -d --rm --name apache -v /mnt:/usr/local/apache2/htdocs -p 8082:80 registry.gitlab.com/mbe99/docker-work/httpd:alpine`
- [ ] [localhost:8082](http://localhost:8082)
- [ ] `$ docker stop apache`

> ohne das Volume, würde das `index.html` des Containers angezeigt werden

- [ ] `$ docker run -d --rm --name apache  -p 8082:80 registry.gitlab.com/mbe99/docker-work/httpd:alpine`
- [ ] [localhost:8082](http://localhost:8082)
- [ ] `$ docker stop apache`

### Mit `docker inspect` die Eigenschaften des Volumes anzeigen

- [ ] `$ docker run -d --rm --name apache -v /mnt:/usr/local/apache2/htdocs -p 8082:80 registry.gitlab.com/mbe99/docker-work/httpd:alpine`
- [ ] `$ docker inspect apache |grep -A 10 Mount`



### Mit der Option `-e` Environment Variablen übergeben

> Welche Variablen unterstützt sind hängt vom Image ab

- [ ] `$ docker run --rm -d --name mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -p 3306:3306 registry.gitlab.com/mbe99/docker-work/mysql:latest` 

> mit einem `MySQL` Client kann nun von Windows auf die Datanbank connected werden

[zurück](README.md)