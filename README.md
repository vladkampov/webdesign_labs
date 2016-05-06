# Webdesign Labs for NTUU "KPI"

Yes, I was very meticulous in the work of this task. But it's damn nice.

## Dependencies
So. Firstly you need to install the latest versions of NodeJS and NPM. 
```
# Using Ubuntu
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
sudo apt-get install -y nodejs

# Using Debian, as root
curl -sL https://deb.nodesource.com/setup_4.x | bash -
apt-get install -y nodejs
```
If you have `nodejs` already installed and want to update, then first remove current instalation and install it again using scripts above.
```
sudo apt-get remove --purge nodejs npm
```

## Instalation
Ok now. To install all of awesome things to use this lab you need just `npm install`. Cool, yeah?

## Usage
Thanks to Grunt we have a few comands to control current project. 
- `grunt` to compile lab
- `grunt clean` for clean all trash like build folder
- `grunt runwatch` to starting Grunt Watch awesome thing for development and automaticly compile all files from coffescript and less c: 
*(in lab 1 and 2 also starts `grunt runserver`)*
- `grunt runserver`starts simple static server, which automaticly bring you to browser right after start. No more unnecessary movements. Just do not forget to compile. **Only for 1 and 2 labs**
- `npm start` to run project.

![Dancing cat, dude](http://99px.ru/sstorage/86/2015/09/image_861809151414179543807.gif)
