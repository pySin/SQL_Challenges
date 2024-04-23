from matplotlib import pyplot as plt
import numpy as np


class PlotGraph:
    def __init__(self, data: list):
        self.data = data
        self.x_axis = [x_ax[0] for x_ax in self.data]
        self.y_axis = [y_ax[1] for y_ax in self.data]
        self.y_axis_2 = [y_ax[2] for y_ax in self.data]

    def plot_data(self):
        plt.style.use('seaborn-v0_8-paper')
        plt.figure(figsize=(10, 4))
        x_indexes = np.arange(len(self.x_axis))
        plt.xticks(ticks=x_indexes, labels=self.x_axis)
        plt.bar(x_indexes - 0.16, self.y_axis, width=0.35, label="Life Expectancy", color="green")
        plt.bar(x_indexes + 0.18, self.y_axis_2, width=0.35, label="GNP in tens of thousands", color="purple")

        # Labels
        plt.title("Life Expectancy Per Continent")
        plt.xlabel("Continent")
        plt.ylabel("Average Years")
        # plt.legend(["Average Life Expectancy", "GNP in tens of thousands"])
        plt.legend()

        # Save picture of the graphic
        plt.savefig("life_expectancy_and_GNP_per_continent.png")
        return plt.show()

