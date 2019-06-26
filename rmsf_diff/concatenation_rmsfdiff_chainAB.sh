#sinon le faire en r avec merge 
sed '1d' test1.txt> test1tmp.txt
sed '1d' test1.txt> test2tmp.txt
cat test1tmp test2tmsp.txt
rm test1tmp.txt
