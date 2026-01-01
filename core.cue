// Identity-based IAM policy structure as closed CUE definitions.
//
// Closedness: CUE definitions (#Foo) are closed types. A concrete value that
// names a field absent from the definition is an evaluation error. This means
// Principal — valid in resource-based policies — is rejected here at vet time
// without any explicit prohibition rule.
package iampolicy

// #Policy represents a single identity-based IAM policy document.
// Version is fixed to the only current AWS value.
#Policy: {
	Version:   "2012-10-17"
	Statement: [...#Statement]
}

// #Statement is a single identity-based Allow entry. Effect is fixed to
// "Allow". Action and Resource are required. Condition is optional with the
// standard IAM operator→key→value shape. Principal is absent: closedness
// makes it an evaluation error if added.
#Statement: {
	Effect:     "Allow"
	Action:     string | [...string]
	Resource:   string | [...string]
	Condition?: {[string]: {[string]: string | [...string]}}
}
