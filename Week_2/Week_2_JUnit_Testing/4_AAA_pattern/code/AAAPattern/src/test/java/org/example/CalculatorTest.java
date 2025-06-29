package org.example;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public class CalculatorTest {
    private Calculator calculator;

    @BeforeEach
    void setUp() {
        calculator = new Calculator();
        System.out.println("Setup");
    }

    @AfterEach
    void tearDown() {
        calculator = null;
        System.out.println("Teardown");
    }

    @Test
    void testAdd() {
        // Arrange
        int n1 = 2;
        int n2 = 3;
        // Act
        int result = calculator.add(n1, n2);
        // Assert
        assertEquals(5, result);
    }

    @Test
    void testSubtract() {
        int n1 = 10;
        int n2 = 4;

        int result = calculator.subtract(n1, n2);
        assertEquals(6, result);
    }

    @Test
    void testMultiply() {
        int n1 = 3;
        int n2 = 4;
        int result = calculator.multiply(n1, n2);

        assertEquals(12, result);
    }

    @Test
    void testDivide() {
        int n1 = 10;
        int n2 = 2;
        int result = calculator.divide(n1, n2);
        assertEquals(5, result);
    }

    @Test
    void testDivideByZero() {
        // Arrange
        int n1 = 10;
        int n2 = 0;

        // Act & Assert
        assertThrows(ArithmeticException.class, () -> calculator.divide(n1, n2));
    }
}
