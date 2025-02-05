 [Pipenv](https://pipenv.pypa.io/en/latest/) es una herramienta que nos permite creat entornos deterministicos para nuestros proyetos de python


## TL:DR

### Instalar pipenv

Una ves tengas instalado tu entorno e python y pip, instala

```bash
pip install --user pipenv
```
Crear un entorno virtual
```bash
pipenv shell
```
Instalar los paquetes de pipfile
```bash
pipenv install
```
### Vs code

Instala la extension de python de microsoft o el paquete de extensiones

[Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python)


[Python Extension pack](https://marketplace.visualstudio.com/items?itemName=donjayamanne.python-extension-pack)

Una ves instaladas presiona control + P para abrir la paleta de comandos, y busca el comando >Python: select interpreter (Si no aparece el simbolo ">" escribelo manualmente)

Una ves hagas esto, vscode debe localizar automaticamente el entorno creado por pipenv