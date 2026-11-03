class Player:
    def __init__(self, name):
        self.name = name
        self.energy = 100

    def use_energy(self, amount):
        self.energy = max(0, self.energy - amount)

    def show_status(self):
        print(f"O‘yinchi: {self.name}")
        print(f"Energiya: {self.energy}")
