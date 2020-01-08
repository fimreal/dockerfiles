#### pt-query-digest

基础镜像(tag: base)是干净的 perl 环境和 pt-query-digest 脚本，方便国内下载使用。用例：
```bash
REPORTFILE=$(mktemp -u report.XXXXXX)
docker run -v $PWD/slowlog:/slowlog epurs/:pt-query-digest --report /slowlog > $REPORTFILE
```
