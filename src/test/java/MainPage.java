import com.codeborne.selenide.Configuration;
import com.codeborne.selenide.Selenide;
import com.codeborne.selenide.SelenideElement;
import org.junit.jupiter.api.Assertions;

import static com.codeborne.selenide.Selenide.$x;

public class MainPage {
    private final SelenideElement SEARCH_FORM = $x("//button[@class='dzen-search-arrow-common__button']");

    public void openWebSite(String url) {
        Selenide.open(url);
    }

    public void hasSearch() {
        //Configuration.timeout = 6000;
        assert SEARCH_FORM.isDisplayed();
        assert (SEARCH_FORM.getText().equals("Найти"));
    }
}
