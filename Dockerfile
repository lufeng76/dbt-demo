FROM fishtownanalytics/dbt:0.21.0
ENV DBT_PROFILES_DIR=/dbt/profile/
COPY profiles.yml /dbt/profile/
COPY keyfile.json /dbt
COPY demo /dbt
#USER root
#RUN chown -R dbt_user /dbt
#USER dbt_user
WORKDIR /dbt
