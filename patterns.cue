package iampolicy

// Resource is left open; the specific bucket is supplied at composition time.
#ReadOnlyObjectFragment: #S3Policy & {
	Statement: [#S3ObjectStatement & {
		Action: "s3:GetObject"
	}]
}

#ApprovedResourcePrefix: =~"^arn:aws:s3:::approved-[^/]+/.*"

// Unification with a policy preserves the approved-prefix constraint.
// A non-approved ARN fails vet rather than silently widening access.
#OrgOverlay: #Policy & {
	Statement: [...{
		Resource: #ApprovedResourcePrefix | [...#ApprovedResourcePrefix]
	}]
}
