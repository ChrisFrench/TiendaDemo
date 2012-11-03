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
mysqldump -uroot -pF0rgetting01 --skip-extended-insert tienda > tienda.sql
git add .
git commit -a -m " updating latest version of tienda"
git push
git push
git ad .
git add .
git add -a -m "Add latest  library fixes"
git commit -a -m "Add latest  library fixes"
git config --global user.name "Tienda Demo"
git config --global user.email "teindademo@ammonitenetworks.com"
 git commit --amend --reset-author
git push
su
ls
mysqldump -uroot -pF0rgetting01 --skip-extended-insert tienda > tienda.sql
mysqldump -uroot -pF0rgetting01 --skip-extended-insert tienda > sql/tienda.sql
exit
