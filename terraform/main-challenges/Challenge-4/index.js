// lambda/index.js
exports.handler = async (event) => {
    console.log('Event:', event);
    const bucketName = process.env.BUCKET_NAME;
    const queueUrl = process.env.QUEUE_URL;
  
    // Your Lambda function logic goes here
  
    return {
      statusCode: 200,
    };
  };