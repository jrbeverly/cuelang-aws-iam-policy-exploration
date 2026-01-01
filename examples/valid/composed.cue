package composed

import iampolicy "example.com/cuelang-aws-iam-policy-exploration:iampolicy"

policy: iampolicy.#ReadOnlyObjectFragment & iampolicy.#OrgOverlay & {
	Statement: [{
		Resource: "arn:aws:s3:::approved-reports/2024/*"
	}]
}
