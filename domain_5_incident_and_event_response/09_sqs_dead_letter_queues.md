# Amazon SQS Dead-Letter Queues
- If a consuemr to process am essage within the visibility timeout, then the message goes back to the queue
- We can set a threshold of how many times a message can go back to the queue
- After the MaximumReceives threshold is exceeded the message goes into a dead letter queue (DLQ)
- Great for debugging

- DLQ of a Fifo Queue must be a FIFO queue
- DLQ of a Standard quee msut be a standard quueue
- Make sure you process/fix/investigte beforewthe DLQ item expires

## SQS DLQ Redrive to Source
- Feature to help consume messages i nthe DLQ to understand what is wrong with them
- When our code is fied, we can redrive the messages from the DLQ back into the soruce quee (or any other queue) in abtcehs without rwiing custom code