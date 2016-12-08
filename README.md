# MyBnB

## Introduction

A database MySQL project for CSCC43 at the University of Toronto.

MyBnB is a re-imagining of the massively popular online sharing economy AirBnB, that aims to provide a quick and efficient way for hosts of locations to connect with potential renters of places of residence. Through ease-of-use for both hosts and renters, MyBnB promotes active sharing and provides relevant avenues to connect these two groups over a common, transparent platform.

## Table of Contents

- [Introduction](#introduction)
- [Documentation](#documentation)
- [How to start](#how-to-start)
- [Contributing](#contributing)

## Documentation

Can be found in the Documentation folder. This includes the SQL E/R Diagrams and the schematic structure.

## How to start

* This project requires _Java 8_ and _MySQL 5.5 or greater_.

1. Execute the files in the **SQL** folder. **You must first execute Structure.sql, and then execute the sample Data.sql.**

2. Edit src/mybnb/data/SQLConstants.java for your database information.

```java
  public static final String SQL_USER = ...;
  public static final String SQL_PASS = ...;
  public static final short SQL_PORT = ...;
  public static final String SQL_ADDR = ...;
```

3. Load up the Java source in your favourite IDE and compile and run.

## Contributing

This project is discontinued. However pull requests and issues will still be accepted.

Want to contribute for a stronger GitHub profile? Here are some easy ideas:

- [ ] Convert project to a Maven one
- [ ] Move database constants to an external configuration file

And here are some more complicated ones:

- [ ] Add a GUI to the rest of the project
- [ ] Refactor code to use more Java 8 features
- [ ] Address the issues in the Documentation section