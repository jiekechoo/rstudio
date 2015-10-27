# rstudio in docker

## get
```
git clone https://github.com/jiekechoo/rstudio.git
```

## build
```
docker build sectong/rstudio .
```
## run
```
docker run -it -d -p 8787:8787 -v $PWD/data:/usr/share/R/library sectong/rstudio
```

## use

http://192.168.1.230:8787
