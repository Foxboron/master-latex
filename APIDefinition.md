Rebuilder + Transparency Log
============================

# Session

// {Hash, Signature, Leafs} should probably be seeded from a trusted 
// source.
// Or we have multiple monitors where we can ask for one hash 3-4 
// places for the rebuilder. Probably not inscope for this thesis

InitQuery{Hash, Signature, Leafs}
-> Response{InclusionProof, ConsistencyProof, CurrentRoot{Hash, Singature}}

// InclusionProof -> The needed subroots to recreate the signed root
// ConsistencyProof -> The needed subroots to recreate the current signed hash.

// Client should verify the InclusionProof and ConsistencyProof. 
// The CurrentRoot should be stored along with any other previous roots.
// If all this can be verified, we know the rebuilder has not modified
// any rebuilds.

PkgQuery{Package, Version} 
-> Response{InclusionEntry, Entry...}

// Inclusion entry is the commited data for the package version.
// The other entires that can be fetched are Revoke entries,
// or multiple InclusionEntires if there has been multiple
// rebuilds of this package.


# Queries

type PkgQuery {
    Package string
    Version string
}

type InitQuery {
    Hash        string
    Signature   string
    Leafs       int
}

# Response

# Entries

type Entry {
    Package string
    Version string
} 

type InclusionEntry {
    Entry
    Package         string
    Buildinfo       string
    Linkmetadata    string
}

type RevokeEntry {
    Entry 
    InclusionHash   string
    Reason          string
}

JSON:
{
    "type": "{inclusion,revoke}",

    // Inclusion
    "linkmetadata": "",
    "buildinfo": "",
    
    // These are needed so we can search for the data with postgresql
    "package": "",
    "version": "",

    // Revoke
    "inclusionHash": "",
    "reason":"",
}
