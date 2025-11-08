import { S3Client, GetObjectCommand } from "@aws-sdk/client-s3";
import { getSignedUrl } from "@aws-sdk/s3-request-presigner";

// Lambda handler
export const handler = async (event: any) => {
  try {
    const bucketArn = process.env.BUCKET_ARN;
    const region = process.env.AWS_REGION;

    if (!bucketArn) {
      throw new Error("Missing BUCKET_ARN environment variable");
    }

    const bucketName = bucketArn.split(":").pop()?.replace(":::", "") ?? "";
    const key = event?.queryStringParameters?.key;

    if (!key) {
      return {
        statusCode: 400,
        body: JSON.stringify({ error: "Missing 'key' parameter" }),
      };
    }

    const s3Client = new S3Client({ region });
    const command = new GetObjectCommand({ Bucket: bucketName, Key: key });

    const signedUrl = await getSignedUrl(s3Client, command, { expiresIn: 3600 });

    return {
      statusCode: 200,
      body: JSON.stringify({ url: signedUrl }),
    };
  } catch (err: any) {
    console.error("Error generating signed URL:", err);
    return {
      statusCode: 500,
      body: JSON.stringify({ error: err.message }),
    };
  }
};
