# RobotFight

RobotFight is a simple Java application that simulates a battle between robots in an arena. 

## Features
- Create robots with health points.
- Pit them against each other in the `Arena`.
- The combat continues until one robot's health is depleted.

## Requirements
- Java 17
- Maven 3.x

## Build and Run

To build the project and create the `.jar` package, run:

```bash
mvn clean package
```

To run the application, you can execute the generated `.jar` or use the `exec:java` maven plugin if configured. However, a quick way to compile and run the Main class is:

```bash
mvn compile
mvn exec:java -Dexec.mainClass="Main"
```
*(Make sure you have the `exec-maven-plugin` added to your pom.xml if you want to use it, otherwise you can just run the compiled class directly with `java -cp target/classes Main`)*

## Testing
The project uses JUnit Jupiter for tests. Run them via:
```bash
mvn test
```

Bonjour Ange
