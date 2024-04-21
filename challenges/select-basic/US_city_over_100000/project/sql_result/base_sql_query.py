from abc import ABC, abstractmethod


class BaseQuery(ABC):

    @abstractmethod
    def query(self):
        pass
        query_instructions = """
        SELECT * FROM world.city
        WHERE CountryCode  = "USA"
        AND Population > 100000;
        """

        return query_instructions
