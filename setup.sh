# Run all shell script in scripts folder
for file in `ls scripts/*.sh`
do
    # echo "Run ${file}"
    bash ${file}
done