package org.example;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public class MainTest {

    @Test
    public void testSeven() {
        int result = Main.seven();
        assertEquals(9, result, "Should return 9");
    }

    @Test
    public void testFunTrue() {
        boolean result = Main.funTrue();
        assertTrue(result);
    }

    @Test
    public void testAbc() {
        String result = Main.abc();
        assertEquals("abc", result);
    }

    @Test
    public void testAssertions() {
        assertEquals(5, 2 + 3);
        assertTrue(5 > 3);
        assertFalse(5 < 3);
        assertNull(null);
        assertNotNull(new Object());
    }
}
