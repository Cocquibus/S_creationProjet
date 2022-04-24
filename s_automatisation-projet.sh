#! /bin/bash
echo 'script v1.3'
echo "script de création de projet"
echo "continuer ? y/n :"
read confirmation
if [ $confirmation = "y" ]
then
    echo "nom du dossier pour le projet:"
    read dossier
    mkdir -p $dossier/{public/{css/,font/,img/,pages/},src/sass/modules}
    touch $dossier/index.html $dossier/src/sass/app.sass $dossier/src/sass/_variable.sass $dossier/src/sass/_font.sass
    echo "création de fichier sass dans le dossier modules ? y/n"
    read creationsass
    if [ $creationsass = "y" ]
    then
        echo "combien de fichiers sass ?"
        read nbrsass
        for (( i = 0 ; i < $nbrsass ; i++ ))
        do
            echo "nom du fichier sass ?"
            read nom
            touch $dossier/src/sass/modules/_$nom.sass
            echo "@import 'modules/_$nom.sass'" >> $dossier/src/sass/app.sass
        done
    fi
    echo "install de bootstrap & fontawesome ? y/n"
    read installbootstrap
    if [ $installbootstrap = "y" ]
    then
    cd $dossier/
        npm init -y
        npm install bootstrap
        npm install @popperjs/core
        npm install @fortawesome/fontawesome-free
        echo "@import '../../node_modules/bootstrap/scss/bootstrap.scss'" >> src/sass/app.sass
        echo '$fa-font-path : "../../node_modules/@fortawesome/fontawesome-free/webfonts"
@import "../../../node_modules/@fortawesome/fontawesome-free/scss/fontawesome.scss"
@import "../../../node_modules/@fortawesome/fontawesome-free/scss/solid.scss"
@import "../../../node_modules/@fortawesome/fontawesome-free/scss/brands.scss"
@import "../../../node_modules/@fortawesome/fontawesome-free/scss/regular.scss"' >> src/sass/modules/icons.sass
        echo "<script src="./node_modules/@popperjs/core/dist/umd/popper.js"></script>
<script src="./node_modules/bootstrap/dist/js/bootstrap.js"></script>" >> index.html
    fi
fi