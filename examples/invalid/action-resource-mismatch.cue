package actionresourcemismatch

import iampolicy "example.com/cuelang-aws-iam-policy-exploration:iampolicy"

// s3:GetObject is object-level; a bucket ARN (no key path) violates the object ARN constraint.
policy: iampolicy.#S3Policy & {
	Statement: [iampolicy.#S3ObjectStatement & {
		Action:   "s3:GetObject"
		Resource: "arn:aws:s3:::my-bucket"
	}]
}
