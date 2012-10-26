ls
git add .
git add 
git init
git add .
git commit -a -m "joomla base files"
git remote add origin https://github.com/AmmoniteNetworks/TiendaDemo.git
git push -u origin master
exit
ls
cd ..
ls
cd tienda/
ls
mysqldump -uroot -pF0rgetting01 tienda > tienda.sql
mysqldump -uroot -pF0rgetting01 --skip-extended-insert tienda > tienda.sql
mkdir sql
mv tienda.sql sql/
git add .
git commit -a -m "Adding Tienda library, and Database dumps"
git push
