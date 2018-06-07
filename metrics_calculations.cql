

LOAD CSV with HEADERS FROM "https://raw.githubusercontent.com/kamranrahman/EthereumAnalyzerProject/master/EthereumCollectorData.csv" AS row                   
MERGE  (a1:Account {address:row.from })
MERGE  (a2:Account {address:row.to })
MERGE (a1)-[:TRANSFERRED_TO {amount : toFloat(row.value_ETH) , date :toString(row.timestamp) }]->(a2);

# Calcualte the page rank on Acount based on the amount and number of transactions in relation to other accounts
CALL algo.pageRank('Acount', 'TRANSFERRED_TO',
  {iterations:20, dampingFactor:0.85, write: true,writeProperty:"pagerank"})
YIELD nodes, iterations, loadMillis, computeMillis, writeMillis, dampingFactor, write, writeProperty


# Calcualte the betweenness on Acount based on the amount and number of transactions in relation to other accounts
CALL algo.betweenness('Acount','TRANSFERRED_TO', {direction:'out',write:true, writeProperty:'centrality'})
YIELD nodes, minCentrality, maxCentrality, sumCentrality, loadMillis, computeMillis, writeMillis;


# Calcualte the closeness on Acount based on the amount and number of transactions in relation to other accounts
CALL algo.closeness('Acount', 'TRANSFERRED_TO', {write:true, writeProperty:'centrality'})
YIELD nodes,loadMillis, computeMillis, writeMillis;



#Next step :

Anomaly detection using the combination of the folowing factors : sequence of transactions for each acount and the trend, on amount of transactions
comunity detection on subgraphs to find fruad/ money laundering rings
Using deep nureal network to do feature detection on properties that cause 
perform a learning on cases of fraud (binary clasification fraud :1 , normal = 0)

#Other use cases of the application after the algorithm trained and built:
1- Bank and ceredit card fraud detection
2- Banks or other industries money laundering detections
3- Social network analyses to find important nodes/ disrubtive nodes
4- Cyber security analyses to detect cyber atacks


