#deploy.sh
echo $#
if [ "$#" -ne 1 ]
then
    echo "Error! Please add commit message."
    exit 1
fi

branchName=`git branch | grep \* | cut -d ' ' -f2`

echo "$branchName"

git add .
git commit -m "$1"
git push
git checkout dev
git merge 1-landing-page
git push
git checkout master
git merge dev
git push
git checkout 1-landing-page