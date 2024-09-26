# sparkenv

# Init sparkenv
```bash
$ wget https://gist.githubusercontent.com/csgn/61b172e5094d7ec56399e004a2181ec0/raw/6cf10cebf0fd436818b6bcacf5b3e8338d98cf77/init-sparkenv.sh && \
  chmod +x init-sparkenv.sh && \
  ./init-sparkenv.sh <env_name> && \
  rm ./init-sparkenv.sh && \
  cd <env_name>
```

# Create spark job
```bash
$ ./scripts/create-job.sh
```

# Submit spark job
```bash
$ ./scripts/spark-submit.sh <project_name> <package_name> <object_name>
```
