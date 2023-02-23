using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using TMPro;
using UnityEngine.UI;
public class MeneUIController : MonoBehaviour
{
    public TMP_Text btnCoin;
    public TMP_Text levelcurrent;
    public Button setting;
    public Button btnShop;
    public Button btnDaily;
    
    private void Start()
    {
        LoadCoin();
        LoadTextLevel();
    }
    private void Update()
    {
        LoadCoin();
        LoadTextLevel();
    }
    public void Init()
    {
        
    }
    public void BtnStartGameMenu()
    {
        SceneManager.LoadScene((DataManager.instance.userData.level+2));
       // SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex + 1);
    }
    public void LoadCoin()
    {
        btnCoin.text = DataManager.instance.userData.coin.ToString();
    }    
    public void LoadTextLevel()
    {
        levelcurrent.text ="Level "+ (DataManager.instance.userData.level+1).ToString();
    }    

    public void ShowSetting()
    {
        GamePopup.instance.ShowPopupSetting();
    }    
    public void ShowPopupShop()
    {
        GamePopup.instance.ShowPopupShop();
    }    
}
