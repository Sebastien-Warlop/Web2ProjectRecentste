import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;

import static org.junit.Assert.assertTrue;

public class TestAddBoek {

    private WebDriver driver;
    String url = "http://localhost:8080/";

    @Before
    public void setUp() throws Exception {
        //System.setProperty("webdriver.chrome.driver", "C:\\Users\\...\\chromedriver.exe");
        System.setProperty("webdriver.chrome.driver", "C:\\Users\\Sébastien\\Documents\\UCLL\\fase 1\\2e semester\\Webontwikkeling 2\\chromedriver.exe");
        driver = new ChromeDriver();
        driver.get(url + "add.jsp");
    }

    @Test
    public void test_Form_is_shown_again_with_error_messages_If_all_fields_are_empty() {
        WebElement naamInput = driver.findElement(By.id("test"));
        naamInput.clear();
        naamInput.sendKeys("");

        WebElement auteurInput = driver.findElement(By.id("auteur"));
        auteurInput.clear();
        auteurInput.sendKeys("");

        WebElement genreInput = driver.findElement(By.id("genre"));
        genreInput.clear();
        genreInput.sendKeys("");

        WebElement ratingInput = driver.findElement(By.id("rating"));
        ratingInput.clear();
        ratingInput.sendKeys("");

        WebElement aantalPaginasInput = driver.findElement(By.id("aantalPaginas"));
        aantalPaginasInput.clear();
        aantalPaginasInput.sendKeys("");

        driver.findElement(By.id("submit")).click();

        assertEquals("Voeg een Boek toe", driver.getTitle());
        ArrayList<WebElement> lis = (ArrayList<WebElement>) driver.findElements(By.tagName("li"));
        assertTrue(containsWebElementsWithText(lis, "Vul een titel in."));
        assertTrue(containsWebElementsWithText(lis, "Vul een auteur in."));
        assertTrue(containsWebElementsWithText(lis, "Vul een genre in."));
        assertTrue(containsWebElementsWithText(lis, "Vul een nummer in voor de rating."));
        assertTrue(containsWebElementsWithText(lis, "Vul een nummer in voor het aantal pagina's."));
    }

    @Test
    public void test_Form_is_shown_again_with_error_messages_If_titel_field_is_left_empty() {
        WebElement titelInput = driver.findElement(By.id("titel"));
        titelInput.clear();
        titelInput.sendKeys("");

        WebElement auteurInput = driver.findElement(By.id("auteur"));
        auteurInput.clear();
        auteurInput.sendKeys("Mark");

        WebElement genreInput = driver.findElement(By.id("genre"));
        genreInput.clear();
        genreInput.sendKeys("Informatief");

        WebElement ratingInput = driver.findElement(By.id("rating"));
        ratingInput.clear();
        ratingInput.sendKeys("5");

        WebElement aantalPaginasInput = driver.findElement(By.id("aantalPaginas"));
        aantalPaginasInput.clear();
        aantalPaginasInput.sendKeys("220");

        driver.findElement(By.id("submit")).click();

        assertEquals("Voeg een Boek toe", driver.getTitle());   //<h1> van voegToe.jsp
        ArrayList<WebElement> lis = (ArrayList<WebElement>) driver.findElements(By.tagName("li"));
        assertTrue(containsWebElementsWithText(lis, "Vul een titel in."));
        assertEquals("Mark",driver.findElement(By.id("auteur")).getAttribute("value"));
        assertEquals("Informatief",driver.findElement(By.id("genre")).getAttribute("value"));
        assertEquals("5",driver.findElement(By.id("rating")).getAttribute("value"));
        assertEquals("220",driver.findElement(By.id("aantalPaginas")).getAttribute("value"));
    }

    @Test
    public void test_formulier_volleding_ingevuld_toont_nieuw_boek_in_overzicht() {
        driver.get(url + "voegToe.jsp");
        fillOutForm("testboek", "iemand", "Avontuur", 6, 140);

        driver.findElement(By.id("submit")).click();

        assertEquals("Overzicht Boeken", driver.getTitle());
        ArrayList<WebElement> tds = (ArrayList<WebElement>) driver.findElements(By.tagName("td"));
        assertTrue(containsWebElementsWithText(tds, "testboek"));
    }

    @After
    public void clean() {
        driver.quit();
    }


    private void fillOutForm(String titel, String auteur, String genre, int rating, int aantalPaginas){
        driver.findElement(By.id("titel")).sendKeys(titel);
        driver.findElement(By.id("auteur")).sendKeys(auteur);
        driver.findElement(By.id("genre")).sendKeys(genre);
        driver.findElement(By.id("rating")).sendKeys(String.valueOf(rating));
        driver.findElement(By.id("aantalPaginas")).sendKeys(String.valueOf(aantalPaginas));
    }

    private boolean containsWebElementsWithText(ArrayList<WebElement> elements, String text) {
        for (int i = 0; i < elements.size(); i ++){
            if (elements.get(i).getText().equals(text)){
                return true;
            }
        }
        return false;
    }
}
