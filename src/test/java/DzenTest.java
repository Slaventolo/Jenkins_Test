import org.junit.jupiter.api.Test;

public class DzenTest extends BaseTest {
    private final static String DZEN_URL = "https://dzen.ru/";

    @Test
    public void testDzenIcon() {
        MainPage mainPage = new MainPage();
        mainPage.openWebSite(DZEN_URL);
        mainPage.hasSearch();
    }
}
