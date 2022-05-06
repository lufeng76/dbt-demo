FROM fishtownanalytics/dbt:1.0.0
ENV DBT_PROFILES_DIR=/dbt/profile/
COPY profiles.yml /dbt/profile/
COPY keyfile.json /dbt
COPY dbt_run.sh /dbt
COPY demo /dbt

#USER root
#RUN chown -R dbt_user /dbt
#USER dbt_user

RUN chmod +x /dbt/dbt_run.sh
WORKDIR /dbt
RUN /dbt/dbt_run.sh deps
ENTRYPOINT []
