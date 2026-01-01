package wrongeffect

import iampolicy "example.com/cuelang-aws-iam-policy-exploration:iampolicy"

// Effect is fixed to "Allow" in #Statement; "Deny" produces a conflicting values error.
policy: iampolicy.#S3Policy & {
	Statement: [iampolicy.#S3ObjectStatement & {
		Effect:   "Deny"
		Action:   "s3:GetObject"
		Resource: "arn:aws:s3:::my-bucket/file.txt"
	}]
}
