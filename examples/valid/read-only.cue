package readonly

import iampolicy "example.com/cuelang-aws-iam-policy-exploration:iampolicy"

policy: iampolicy.#S3Policy & {
	Statement: [iampolicy.#S3ObjectStatement & {
		Action:   "s3:GetObject"
		Resource: "arn:aws:s3:::my-data-bucket/reports/*"
	}]
}
