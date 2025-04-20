import com.codeborne.selenide.Configuration;
import com.codeborne.selenide.Selenide;
import com.codeborne.selenide.SelenideElement;
import org.junit.jupiter.api.Assertions;

import static com.codeborne.selenide.Selenide.$x;

public class MainPage {
    private final SelenideElement SEARCH_FORM = $x("//form[@role='search']");

    public void openWebSite(String url) {
        Selenide.open(url);
    }

    public void hasSearch() {
        Configuration.timeout = 6000;
        assert SEARCH_FORM.exists();
        assert SEARCH_FORM.isDisplayed();
    }
}
