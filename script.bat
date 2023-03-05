echo "Criando as imagens..........."

docker build -t moiseslcar/projeto-backend:1.0 backend/.
docker build -t moiseslcar/projeto-database:1.0 database/.

echo "Realizando o push das imagens......."

docker push moiseslcar/projeto-backend:1.0
docker push moiseslcar/projeto-database:1.0

echo "Criando serviços no cluster kubernetes...."

kubectl apply -f ./services.yml

echo "Criando os deployments...."

kubectl apply -f ./deployment.yml