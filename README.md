
[![minimal R
version](https://img.shields.io/badge/R%3E%3D-3.6.0-6666ff.svg)](https://cran.r-project.org/)
[![Netlify
Status](https://api.netlify.com/api/v1/badges/b3a76bf0-ec22-487d-b567-7c2ea7ff4812/deploy-status)](https://app.netlify.com/sites/twitterapi/deploys)
![Build
Status](https://img.shields.io/travis/timtrice/twitter_api/master.svg)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

# twitterAPI (0.0.0.9000)

## Analyzing timtrice’s twitter feed using the API

### Prerequisites

| Package    | Version |
| :--------- | :------ |
| here       | \*      |
| devtools   | \*      |
| dplyr      | \*      |
| kableExtra | \*      |
| purrr      | \*      |
| rtweet     | \*      |
| scales     | \*      |
| stringr    | \*      |
| usethis    | \*      |
| workflowr  | \*      |

\* - Version not specified

#### Docker

A Docker image of this project is available for
    use.

  - [timtrice/twitter\_api](https://cloud.docker.com/repository/docker/timtrice/twitter_api)

##### Run

Set $LOCAL to your

    LOCAL="/home/timtrice/Projects/ropensci/rrricanes"
    
    docker run \
      -dti \
      -e DISABLE_AUTH=true \
      -p 8787:8787 \
      --name twitter_api \
      -v $LOCAL:/home/rstudio/twitter_api \
      timtrice/twitter_api:release

##### Shell

    docker exec -ti twitter_api /bin/bash

### Built With

  - [R 3.6.0](https://www.r-project.org/) - The R Project for
    Statistical Computing

### Contributing

Please read
[CONTRIBUTING.md](https://github.com/timtrice/twitter_api/blob/master/.github/CONTRIBUTING.md)
for details on our code of conduct, and the process for submitting pull
requests to us.

### Code of Conduct

Please note that the ‘twitterAPI’ project is released with a
[Contributor Code of Conduct](.github/CODE_OF_CONDUCT.md). By
contributing to this project, you agree to abide by its terms.

### Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions
available, see the [tags on this
repository](https://github.com/timtrice/twitter_api/tags).

### Authors

  - Trice, Tim (Role(s): aut, cre)

### License

This project is licensed under the MIT License - see the
[LICENSE.md](LICENSE.md) file for details

### Acknowledgements
