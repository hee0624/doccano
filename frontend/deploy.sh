docker cp 3c299af7f6e5:/app/dist /data/service/doccano/frontend
#cp  /data/service/doccano/frontend/app /data/service/doccano/frontend
#cp -r /data/service/doccano/frontend/app /data/service/doccano/frontend
#rm -r /data/service/doccano/frontend/app
docker cp dist acecf574d6ba:/var/www 
docker restart acec
