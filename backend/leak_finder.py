# Fichier : backend/leak_finder.py
class LeakFinder:
    def __init__(self):
        self.error_logs = []

    def log_hand_error(self, street, error_type, ev_loss):
        self.error_logs.append({
            "street": street,
            "error_type": error_type,
            "ev_loss": ev_loss
        })

    def generate_leak_report(self):
        if not self.error_logs:
            return "Aucun leak détecté. Excellent jeu !"
        
        total_ev_loss = sum(log["ev_loss"] for log in self.error_logs)
        report = f"--- RAPPORT LEAK FINDER ---\n"
        report += f"Pertes totales en EV-Chips : -{total_ev_loss}\n"
        report += f"Nombre d'erreurs enregistrées : {len(self.error_logs)}\n"
        return report

if __name__ == "__main__":
    finder = LeakFinder()
    finder.log_hand_error("Flop", "C-Bet Overplay vs Calling Station", 15)
    print(finder.generate_leak_report())
