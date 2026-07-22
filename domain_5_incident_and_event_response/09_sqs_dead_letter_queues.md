# Amazon SQS Dead-Letter Queues
- If a consumer fails to process a message within the visibility timeout, then the message goes back to the queue
- We can set a threshold of how many times a message can go back to the queue
- After the MaximumReceives threshold is exceeded the message goes into a dead letter queue (DLQ)
- Great for debugging

- DLQ of a FIFO Queue must be a FIFO queue
- DLQ of a Standard queue must be a standard queue
- Make sure you process/fix/investigte beforewthe DLQ item expires

## SQS DLQ Redrive to Source
- Feature to help consume messages in the DLQ to understand what is wrong with them
- then when our code is fixed, we can redrive the messages from the DLQ back into the soruce queu (or any other queue) in batches without writing any custom code integration