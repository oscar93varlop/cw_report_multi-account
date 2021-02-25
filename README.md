# cw_report_multi-account
_Si tienes multiples cuentas de #AWS y quieres mirar que esta alarmado sin tener que abrir la consola cuenta por cuenta por cuenta y se hacemas tedioso cuando se ingresa por SSO y/o se tiene MFA por temas de seguridad _

## Comenzando 🚀

_Estas instrucciones te permitirán optimizar tiempo y generar un reporte envia a algun canal de #slack._

### Pre-requisitos 📋

_aws cli version 2, como minimo 2 cuentas, un canal de Slack al cual enviar el reporte (opcional)_

```
aws --version
```

_debes nombrar los perfiles de las cuentas con los numeros _

```
aws configure --profile 1
```
_asi debe lucir tu archivos de credentials que encontras en tu carpeta $path/.AWS_

```
[1]
aws_access_key_id = dsgsf.......sdsf
aws_secret_access_key = sdfsg.........sdfdsfsd
[2]
aws_access_key_id = dsgsf.......sdsf
aws_secret_access_key = sdfsg.........sdfdsfsd
[3]
aws_access_key_id = dsgsf.......sdsf
aws_secret_access_key = sdfsg.........sdfdsfsd
```

_Webhook que apuente a algun canal de Slack_

```
https://hooks.slack.com/services/SDHGFDFGH/AESTTHGGFSAD/aetsfhgfsdrtfyh (es un enlace falso)
```

### Instalación 🔧

_Paso a Paso de como realizar este reporte _

_Dí cómo será ese paso_

```
git clone https://github.com/oscar93varlop/cw_report_multi-account.git
```

_damos permisos de ejecucion a los archivos sh_

```
chmod +x *.sh
```

_debes modificar el archico  automation_cw.sh en la linea 2, por la cantidad de cuentas a revisar_

```
for ((num=1; num<=3; num++ ))
```

_debes modificar el archico  automation_cw.sh en la linea 6 y agregar el nombre de la cuenta en cada case que coincida con el numero de los profile de aws_

```
case $num in
		1)
			sed -i '1i Prod' $num.txt
			;;
		2)
		  sed -i '1i Dev' $num.txt
			;;
		3)
			sed -i '1i qa $num.txt
			;;
		esac 
```

_debes modificar el archico  automation_cw.sh en la linea 28, y agregar el webhook, el canal al cual se va a subir el reporte / usuario que quieres que aparezca en el mensaje  /  emoji de slack / nombre del archivo / titulo del reporte 

```
sh msg_to_slack.sh -h https://hooks.slack.com/services/bbbbbbbb/aaaaaaa/wsryhrtdgsdfyghf -c nombre del canal -u user.example -i scroll -F rutina.txt -T "report"
```
_Finaliza con un mensaje donde listara el nombre de las alarmas en estado **ALARM** y la cantidad de alarmas en estado **INSUFFICIENT_DATA**_

```
sh automation_cw.sh
```

__


## Ejecutando las pruebas ⚙️

_Explica como ejecutar las pruebas automatizadas para este sistema_

### Analice las pruebas end-to-end 🔩

_Explica que verifican estas pruebas y por qué_

```
Da un ejemplo
```

### Y las pruebas de estilo de codificación ⌨️

_Explica que verifican estas pruebas y por qué_

```
Da un ejemplo
```

## Despliegue 📦

_Agrega notas adicionales sobre como hacer deploy_

## Construido con 🛠️

_Menciona las herramientas que utilizaste para crear tu proyecto_

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - El framework web usado
* [Maven](https://maven.apache.org/) - Manejador de dependencias
* [ROME](https://rometools.github.io/rome/) - Usado para generar RSS

## Contribuyendo 🖇️

Por favor lee el [CONTRIBUTING.md](https://gist.github.com/villanuevand/xxxxxx) para detalles de nuestro código de conducta, y el proceso para enviarnos pull requests.

## Wiki 📖

Puedes encontrar mucho más de cómo utilizar este proyecto en nuestra [Wiki](https://github.com/tu/proyecto/wiki)

## Versionado 📌

Usamos [SemVer](http://semver.org/) para el versionado. Para todas las versiones disponibles, mira los [tags en este repositorio](https://github.com/tu/proyecto/tags).

## Autores ✒️

_Menciona a todos aquellos que ayudaron a levantar el proyecto desde sus inicios_

* **Andrés Villanueva** - *Trabajo Inicial* - [villanuevand](https://github.com/villanuevand)
* **Fulanito Detal** - *Documentación* - [fulanitodetal](#fulanito-de-tal)

También puedes mirar la lista de todos los [contribuyentes](https://github.com/your/project/contributors) quíenes han participado en este proyecto. 

## Licencia 📄

Este proyecto está bajo la Licencia (Tu Licencia) - mira el archivo [LICENSE.md](LICENSE.md) para detalles

## Expresiones de Gratitud 🎁

* Comenta a otros sobre este proyecto 📢
* Invita una cerveza 🍺 o un café ☕ a alguien del equipo. 
* Da las gracias públicamente 🤓.
* etc.



---
⌨️ con ❤️ por [Villanuevand](https://github.com/Villanuevand) 😊
