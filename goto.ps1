param([String]$b="develop")

git fetch
git checkout $b
git pull