from project.graph_create import QueryGraph

QG = QueryGraph("localhost", "root", "dance")
print(QG.plot_query_data())
