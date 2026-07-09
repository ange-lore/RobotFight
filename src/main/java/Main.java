public class Main {
    public static void main(String[] args) {
        System.out.println("Welcome to RobotFight!");
        
        Robot d2r2 = new Robot("D2R2");
        Robot data = new Robot("Data");
        
        Arena arena = new Arena();
        System.out.println("The fight begins between " + d2r2.getRobotName() + " and " + data.getRobotName() + "!");
        
        Robot winner = arena.fight(d2r2, data);
        
        System.out.println("The winner is " + winner.getRobotName() + "!");
    }
}
