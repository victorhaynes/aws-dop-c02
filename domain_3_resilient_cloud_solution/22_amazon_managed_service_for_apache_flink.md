# Amazon Managed Service for Apache Flink
- used to be called Kinesis Data Analytics for Apache Flink
- Flink is a framework (Java, Scala, or SQL) for processing data streams in real time

- Run any Apache Flink application on a managed cluster on AWS
    - provisioned compute resources, parallel computation, automatic scaling
    - Application backups 
    - Use any Apache Flink programming feature sto transform data
    - `EXAM` Flink can read from KDS but NOT ADF
        - and this actually makes sense, KDS is the data stream/highway (while ADF is a delivery system mostly)
