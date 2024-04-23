from project.sql_result.base_sql_query import BaseQuery


class Query(BaseQuery):

    @staticmethod
    def query():

        query_instructions = """
                            SELECT Continent,
                                COALESCE(ROUND(AVG(LifeExpectancy)), 0) AS AVG_LE,
                                COALESCE(ROUND(AVG(GNP) / 10000, 1), 0) AS AVG_GNP_in_Ten_Thousants
                                FROM world.country
                            GROUP BY Continent;
                             """

        return query_instructions
