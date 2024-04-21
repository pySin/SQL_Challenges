import mysql.connector


class SQLConnection:

    def __init__(self, host: str, user: str, password: str):
        self.host = host
        self.user = user
        self.password = password

    def connect(self):
        conn = mysql.connector.connect(host=self.host, user=self.user, password=self.password)
        return conn


# sql_c = SQLConnection("localhost", "root", "dance")
# conn_x = sql_c.connect()

# import mysql.connector
#
# conn = mysql.connector.connect(host='localhost', user='root',
#                                        password='dance')  # MySQL connection.
