from project.sql_result.base_sql_query import BaseQuery


class Query(BaseQuery):

    def query(self):
        query_instructions = """
                            SELECT Name, Population FROM world.city
                            WHERE CountryCode  = "USA"
                            AND Population > 100000
                            ORDER BY Population DESC
                            LIMIT 7;
                             """

        return query_instructions
