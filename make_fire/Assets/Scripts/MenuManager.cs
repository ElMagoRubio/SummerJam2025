using System.Collections.Generic;
using UnityEngine;

public partial class MenuManager : MonoBehaviour
{
	[SerializeField]
	private MainMenu _mainMenu;

	[SerializeField]
	private OptionsMenu _optionsMenu;

	private List<Menu> _menus;

	public MainMenu mainMenu => _mainMenu;

	public OptionsMenu OptionsMenu => _optionsMenu;


	private void Awake()
	{
		_menus = new List<Menu>();

		_menus.Add(_mainMenu);
		_menus.Add(_optionsMenu);
	}

	public void ShowMainMenu()
	{
		SetActiveMenu(_mainMenu);
	}

	public void ShowOptionsMenu()
	{
		SetActiveMenu(_optionsMenu);
	}

	private void SetActiveMenu(Menu selectedMenu)
	{
		foreach (Menu menu in _menus)
		{
			menu.Hide();
		}

		selectedMenu.Show();
	}
}
