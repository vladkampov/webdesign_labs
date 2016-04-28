# Webdesign Labs for NTUU "KPI"

Yes, I was very meticulous in the work of this task. But it's damn nice.

To run one of this labs on your own Unix you need to:
```
    sudo npm install -g npm
    sudo npm install -g npm 
``` 
yes, twice ¯\\_(ツ)_/¯
then
```
    git clone https://github.com/vladkampov/webdesign_labs.git
    cd webdesign_labs/
    ls
```
Then go to folder with your lab and for download all dependencies you need to run
```
    npm install
```
It command simply install all dependencies for your own lab.

Thanks to Grunt we have a few comands to control current project 
  - To compile all project run``` grunt ```
  - To clear temp fiels just run ``` grunt clear ```
  - To compile your project and run server (yes, browser will open automaticly) run ``` grunt runserver ```
  - To compile, run project and enable `Grunt Watch task` to comfortable development simply run ``` grunt runwatch ``` and all of your changes in src files will compile automaticly and browser will refresh... wait for it... AUTOMATICLY! 
  