CREATE CONSTRAINT ON (c:Country) ASSERT c.name IS UNIQUE;
MERGE (sco:Country { name:"Scotland" });