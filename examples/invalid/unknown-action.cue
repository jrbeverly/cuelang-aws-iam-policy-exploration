package unknownaction

import iampolicy "example.com/cuelang-aws-iam-policy-exploration:iampolicy"

// s3:Frobnicate is not in the S3 action catalog; vet rejects it.
policy: iampolicy.#S3Policy & {
	Statement: [iampolicy.#S3Statement & {
		Action:   "s3:Frobnicate"
		Resource: "arn:aws:s3:::my-bucket/file.txt"
	}]
}
