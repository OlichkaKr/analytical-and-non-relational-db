// Databricks notebook source
import org.apache.spark.eventhubs.{ ConnectionStringBuilder, EventHubsConf, EventPosition }
// import org.apache.spark.eventhubs._
import com.microsoft.azure.eventhubs._
import org.apache.spark.sql
import org.apache.spark.sql.functions._
import org.apache.spark.sql.types._

val connStr = "Endpoint=sb://nulplabsqldoc.servicebus.windows.net/;SharedAccessKeyName=policy;SharedAccessKey=VqnxEXkl6V9w8P7bW2JoWhGCmn50BXrzhuke7vtggNQ=;EntityPath=nulplabs"

val customEventhubParameters = EventHubsConf(connStr)
  .setStartingPosition(EventPosition.fromStartOfStream)
  .setConsumerGroup("$Default")

val eventhubStream = spark.readStream
      .format("eventhubs")
      .options(customEventhubParameters.toMap)
      .load()

val messages = eventhubStream
    .select(get_json_object(($"body").cast(StringType), "$.case_number").alias("case_number"),
           get_json_object(($"body").cast(StringType), "$.block").alias("block"),
           get_json_object(($"body").cast(StringType), "$.primary_type").alias("primary_type"),
           get_json_object(($"body").cast(StringType), "$.description").alias("description"))

messages.createOrReplaceTempView("data")


val appID = "6c279aa8-1283-4fd0-8588-e1169460aed3"
val password = "mH0SZpi63-5vwpo1-5.Tn3L1Mu0~4Xpo9-"
val tenantID = "b871bdda-3bf0-4839-81ae-96bedda27190"
val fileSystemName = "dblabs";
var storageAccountName = "adlsdblabs";
val accountKey = "jHDtjvnvZpYLSf89g9NldY8lrOYkhvVdqMqckAK0RKn91QromzBIZNL8Jm3lUgLt00x+20gqzshdJr/emOe9RQ=="
 
spark.conf.set(s"fs.azure.account.key." + storageAccountName + ".dfs.core.windows.net", accountKey)
spark.conf.set("fs.azure.createRemoteFileSystemDuringInitialization", "true");

val aggDF = messages.groupBy("case_number", "block", "primary_type", "description").count()

aggDF
    .writeStream
    .queryName("Result")
    .outputMode("complete")
    .format("memory")
    .start();


// COMMAND ----------

val selected = spark.sql("select * from Result")
display(selected)

// COMMAND ----------

selected.write.csv("abfss://" + fileSystemName + "@" + storageAccountName + ".dfs.core.windows.net/4");
