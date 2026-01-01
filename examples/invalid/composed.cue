package composed

import iampolicy "example.com/cuelang-aws-iam-policy-exploration:iampolicy"

// "other-bucket" does not start with "approved-"; cue vet rejects this.
policy: iampolicy.#ReadOnlyObjectFragment & iampolicy.#OrgOverlay & {
	Statement: [{
		Resource: "arn:aws:s3:::other-bucket/data/*"
	}]
}
