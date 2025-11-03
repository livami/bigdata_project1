package event_generator;

import java.time.Duration;
import java.util.Properties;
import java.util.Random;

import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.Producer;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.clients.producer.RecordMetadata;

public class EventGenerator {

	public static void main(String[] args) {
		
		String group = "group10"; 

		String topic = group + "_sales"; 

		// connects to Kafka and creates a producer that lets us send events
		Properties props = new Properties();
		props.put("bootstrap.servers", "192.168.111.10:9092");
		props.put("key.serializer", "org.apache.kafka.common.serialization.StringSerializer");
		props.put("value.serializer", "org.apache.kafka.common.serialization.StringSerializer");

		@SuppressWarnings("resource")
		Producer<String, String> producer = new KafkaProducer<>(props);

		 String[] products = {
		            "garden_gloves",
		            "garden_pots",
		            "garden_shovel",
		            "garden_rakes"
		        };

	     Random random = new Random();

		for (;;) { // endless loop

			String key = products[random.nextInt(products.length)];
			String value = "" + Math.floor(Math.random() * 5 + 1); 

			ProducerRecord<String, String> record = new ProducerRecord<>(topic, key, value);
			producer.send(record, (RecordMetadata metadata, Exception exception) -> {
				if (exception != null) {
					exception.printStackTrace();
				} else {
					System.out.printf("Sent event(key=%s value=%s)%n", key, value);
				}
			});

			
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
			}
		}
	}

}
