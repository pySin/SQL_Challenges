from matplotlib import pyplot as plt


class PlotGraph:
    def __init__(self, data: list):
        self.data = data
        self.x_axis = [x_ax[0] for x_ax in self.data]
        self.y_axis = [y_ax[1] for y_ax in self.data]

    def plot_data(self):
        plt.figure(figsize=(10, 4))
        plt.bar(self.x_axis, self.y_axis)
        return plt.show()

