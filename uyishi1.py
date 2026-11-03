
class Athlete:
    def __init__(self, name, sport, age):
        self.name = name
        self.sport = sport
        self.age = age

    def show_info(self):
        print(f"Ism: {self.name}")
        print(f"Sport turi: {self.sport}")
        print(f"Yosh: {self.age}")

