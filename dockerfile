FROM bash

WORKDIR app

ADD ["statsWords.sh", "/app"]
ADD ["statsUsageWords.sh", "/app"]
ADD ["findNames.sh", "/app"]
ADD ["statsSentences.sh", "/app"]
ADD ["blankLinesCounter.sh", "/app"]
ADD ["caseConverter.sh", "/app"]
ADD ["substringReplace.sh", "/app"]
ADD ["blockSelection.sh", "/app"]
ADD ["palindromeDetection.sh", "/app"]
ADD ["texto.txt", "/app"]

ENTRYPOINT ["bash", "menu.sh"]
