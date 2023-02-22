using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GamePopup :MonoBehaviour
{
    public Canvas canvas;
    public static GamePopup instance;
    private void Awake()
    {
        if (instance == null)
        {
            instance = this;
        }
        DontDestroyOnLoad(gameObject);
    }
    public PopupSetting popupSettingPrefab;
    public PopupShop popupShopPrefab;

    public void ShowPopupSetting()
    {
      
            Instantiate(popupSettingPrefab, canvas.transform, false);
    }    
    public void ShowPopupShop()
    {
        Instantiate(popupShopPrefab, canvas.transform, false);
    }    

}
