class Circle:
    PI = 3.14

    def __init__(self, radius):
        self.radius = radius

    def area(self):
        return self.PI * self.radius ** 2

    def diameter(self):
        return self.radius * 2
