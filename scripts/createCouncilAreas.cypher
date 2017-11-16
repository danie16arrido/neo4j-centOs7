CREATE CONSTRAINT ON (ca:CouncilArea) ASSERT ca.name IS UNIQUE;

CREATE CONSTRAINT ON (ca:CouncilArea) ASSERT ca.code IS UNIQUE;

MATCH (sco:Country { name:"Scotland" });

LOAD CSV WITH HEADERS FROM "file:///CouncilArea2011Lookup.csv" AS line

MERGE (ca:CouncilArea { code: line.CouncilArea2011Code, name: line.CouncilArea2011Name })

MERGE (ca)-[BELONGS_TO]->(sco);

