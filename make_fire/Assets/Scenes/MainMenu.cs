using UnityEngine;
using UnityEngine.SceneManagement;

public class MainMenu : MonoBehaviour
{
    public GameObject mainMenu;       // Panel con Jugar, Opciones, Salir
    public GameObject optionsMenu;    // Panel con sliders y Volver

    public void Jugar()
    {
        SceneManager.LoadScene("Juego");
    }

    public void Opciones()
    {
        mainMenu.SetActive(false);
        optionsMenu.SetActive(true);
    }

    public void Volver()
    {
        optionsMenu.SetActive(false);
        mainMenu.SetActive(true);
    }

    public void Salir()
    {
        Application.Quit();
        Debug.Log("Salir del juego");
    }

    public void PantallaCompleta()
    {
        Screen.fullScreen = !Screen.fullScreen;
    }
}
