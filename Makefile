#!make
include .env
export $(shell sed 's/=.*//' .env)

create:
	eb create ${DEPLOY_SERVICE}-${DEPLOY_ENV} \
		--cname ${DEPLOY_SERVICE}-${DEPLOY_ENV} \
		--instance_profile ${DEPLOY_INSTANCE_PROFILE} \
		--platform ${DEPLOY_PLATFORM} \
		--elb-type ${DEPLOY_ELB_TYPE}

deploy:
	eb deploy ${DEPLOY_SERVICE}-${DEPLOY_ENV} \
		--region ${DEPLOY_REGION} \
		--staged

ssh:
	eb ssh

rebuild:
	aws elasticbeanstalk rebuild-environment --environment-name ${DEPLOY_SERVICE}-${DEPLOY_ENV}

kill:
	eb terminate --force

serve:
	php artisan serve

keys:
	aws s3 cp ${DEPLOY_ID_RSA_FILE} s3://${DEPLOY_EB_S3_BUCKET}/.ssh/id_rsa

setenv:
	eb setenv `cat .env | xargs | sed -e 's/ / /g'` -e ${DEPLOY_SERVICE}-${DEPLOY_ENV}
