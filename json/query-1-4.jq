JOIN(INDEX(.adresy[]; .iri); .fitnessCentra | map(select(.naAdrese != null))[]; .naAdrese.iri)