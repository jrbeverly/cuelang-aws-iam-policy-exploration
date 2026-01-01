// S3 action catalog and action↔resource-shape semantics.
//
// Actions are split into two disjoint sets by the resource level they address.
// Discriminated statement shapes enforce the binding: the wrong ARN shape for
// an action — or any action outside the catalog — fails at cue vet time.
package iampolicy

// Object-level actions target individual S3 objects and require an object ARN.
#S3ObjectAction:
	"s3:GetObject" |
	"s3:PutObject" |
	"s3:DeleteObject" |
	"s3:HeadObject" |
	"s3:GetObjectTagging" |
	"s3:PutObjectTagging"

// Bucket-level actions target S3 buckets as a whole and require a bucket ARN.
#S3BucketAction:
	"s3:ListBucket" |
	"s3:CreateBucket" |
	"s3:DeleteBucket" |
	"s3:GetBucketLocation" |
	"s3:GetBucketVersioning"

// Object ARN: arn:aws:s3:::<bucket>/<key> — contains a forward slash.
#S3ObjectARN: =~"^arn:aws:s3:::[^/]+/.+"

// Bucket ARN: arn:aws:s3:::<bucket> — no slash or key path.
#S3BucketARN: =~"^arn:aws:s3:::[^/]+$"

// #S3ObjectStatement binds object-level actions to object ARNs.
// Pairing an object action with a bucket ARN fails both arms and is rejected.
#S3ObjectStatement: #Statement & {
	Action:   #S3ObjectAction | [...#S3ObjectAction]
	Resource: #S3ObjectARN | [...#S3ObjectARN]
}

// #S3BucketStatement binds bucket-level actions to bucket ARNs.
#S3BucketStatement: #Statement & {
	Action:   #S3BucketAction | [...#S3BucketAction]
	Resource: #S3BucketARN | [...#S3BucketARN]
}

// #S3Statement is the union. A concrete value must satisfy exactly one arm:
// the action set and ARN pattern must agree. A mismatch exhausts both arms
// and fails vet.
#S3Statement: #S3ObjectStatement | #S3BucketStatement

// #S3Policy narrows #Policy to S3-specific statement shapes.
#S3Policy: #Policy & {
	Statement: [...#S3Statement]
}
