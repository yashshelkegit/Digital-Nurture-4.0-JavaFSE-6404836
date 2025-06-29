package org.example;

import junit.framework.TestCase;
import org.junit.Test;

public class MainTest extends TestCase {

    @Test
    public void testSeven() {
        int result = Main.seven();
        assertEquals("Should return 7", 9, result);
    }
    @Test
    public void testFunTrue() {
        boolean result = Main.funTrue();
        assertEquals(true, result);
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
