# EthereumAnalyzerProject

My colleague and I are co-owning this project for a blockchain hackathon at EY.

Our hackathon idea is completed and fully checked into this project repo. It consists of a web collector that queries the Ethereum blockchain for transactions to use as training data. Then it takes that training data and loads it into a Neo4j graph database. Through the Neo4j graph database we run the training data through a series of algorithms so that we can carry out an unsupervised learning experiment. The algorithms primarily measure on centrality and betweenness between addresses. The algorithmic output from the Neo4j graph database is then output into a JSON format, which we then serve up to the front-end UI using a force directed graph visualization through the use of D3.

The front end is not pretty, as many of the nodes seem to go off the screen. 


Nonetheless, clusterings are clear, and we can continue to add new data to teach our graph database, so that it can continuously update its graph metrics for better identifying meaningful clusters. A user can also hover over a node to see the id of the node. We didn't use the actual addresses as the ids of the nodes because they are too long, but if you are really interested in seeing the address associated with a node, you can look up the address of a node's id by going straight to the JSON data source where the address is stored as a property called "label". 
