from project.sql_result.base_sql_query import BaseQuery


class Query(BaseQuery):

    @staticmethod
    def query():

        query_instructions = """
                            SELECT Continent, COALESCE(ROUND(AVG(LifeExpectancy)), 0) AS AVG_LE
                            FROM world.country
                            GROUP BY Continent;
                             """

        return query_instructions
