from project.graph_create import QueryGraph

QG = QueryGraph("localhost", "root", "***your password***")
print(QG.plot_query_data())
