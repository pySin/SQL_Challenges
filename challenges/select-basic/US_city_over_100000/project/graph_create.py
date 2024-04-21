from project.plotting.plot_graph import PlotGraph
from project.sql_result.sql_connection import SQLConnection
from project.sql_result.sql_query import Query


class QueryGraph:
    def __init__(self, host: str, user: str, password: str):
        self.connection_obj = SQLConnection(host, user, password)
        self.connection = self.connection_obj.connect()
        self.query = Query().query()

    def plot_query_data(self):
        cursor = self.connection.cursor()
        cursor.execute(self.query)
        result = cursor.fetchall()
        cursor.close()
        self.connection.commit()
        plot_graph = PlotGraph(result)
        plot_graph.plot_data()
        return result


