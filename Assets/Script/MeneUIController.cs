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
    public GameObject setting;
    private void Start()
    {
        LoadCoin();
        LoadTextLevel();
    }
    public void BtnStartGameMenu()
    {
        SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex + 1);
    }
    public void LoadCoin()
    {
        btnCoin.text = DataManager.instance.userData.coin.ToString();
    }    
    public void LoadTextLevel()
    {
        levelcurrent.text ="Level "+ (DataManager.instance.userData.level+1).ToString();
    }    

    
}
