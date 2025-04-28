import com.codeborne.selenide.Configuration;
import com.codeborne.selenide.Selenide;
import io.github.bonigarcia.wdm.WebDriverManager;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;

public abstract class BaseTest {
    public void setApp() {
        WebDriverManager.chromedriver().setup();
        Configuration.browser = "chrome";
        Configuration.webdriverLogsEnabled = true;
        Configuration.browserSize = "1600x780";
        Configuration.headless = true;
    }

    @BeforeEach
    public void init() {
        setApp();
    }

    @AfterEach
    public void tearDown() {
        Selenide.closeWebDriver();
    }
}
