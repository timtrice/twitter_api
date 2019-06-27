GH_REPO="@github.com/$TRAVIS_REPO_SLUG.git"
FULL_REPO="https://$GH_TOKEN$GH_REPO"
git config --global user.name "Travis CI"
git config --global user.email "tim.trice@gmail.com"
git clone https://github.com/timtrice/twitter_api.git
cd twitter_api
Rscript --verbose code/02_retrieve.R
git add output/favorites.rds
git commit -m 'Update favorites dataset'
git push --force $FULL_REPO
Rscript -e 'workflowr::wflow_build(verbose = TRUE, view = FALSE);'
cd docs
git init
git add .
git commit -m 'Rebuild docs'
git push --force $FULL_REPO master:gh-pages
