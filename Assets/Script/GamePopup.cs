using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GamePopup : MonoBehaviour
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
        popupSettingPrefab.gameObject.SetActive(true);
        //Instantiate(popupSettingPrefab, canvas.transform, false);
    }
    public void ShowPopupShop()
    {
        popupShopPrefab.gameObject.SetActive(true);
        //Instantiate(popupShopPrefab, canvas.transform, false);
    }
    public void OnClickSkin()
    {
        Debug.Log("buy correct");
        DataManager.instance.UpSkin();
    }


}
