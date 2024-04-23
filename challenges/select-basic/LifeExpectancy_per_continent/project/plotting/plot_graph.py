from matplotlib import pyplot as plt


class PlotGraph:
    def __init__(self, data: list):
        self.data = data
        self.x_axis = [x_ax[0] for x_ax in self.data]
        self.y_axis = [y_ax[1] for y_ax in self.data]

    def plot_data(self):
        plt.style.use('seaborn-v0_8-paper')
        plt.figure(figsize=(10, 4))
        plt.bar(self.x_axis, self.y_axis)

        # Labels
        plt.title("Life Expectancy Per Continent")
        plt.xlabel("Continent")
        plt.ylabel("Average Years")
        plt.legend(["Average Life Expectancy"])

        # Save picture of the graphic
        plt.savefig("life_expectancy_per_continent.png")
        return plt.show()

