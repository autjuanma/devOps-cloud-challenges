import pika

connection = pika.BlockingConnection(pika.ConnectionParameters('rabbitmq'))
channel = connection.channel()

channel.queue_declare(queue='task_queue', durable=True)

def callback(ch, method, properties, body):
    print("Received message:", body)
    # Perform task
    print("Task completed")

channel.basic_consume(queue='task_queue', on_message_callback=callback, auto_ack=True)

print("Worker started")