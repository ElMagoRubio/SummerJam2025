using UnityEngine;
using UnityEngine.SceneManagement;

public class MainMenu : Menu
{
    public Menu mainMenu;       // Panel con Jugar, Opciones, Salir
    public Menu optionsMenu;    // Panel con sliders y Volver

    public void Jugar()
    {
        SceneManager.LoadScene("Juego");
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
