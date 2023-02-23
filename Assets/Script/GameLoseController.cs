using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.UI;
public class GameLoseController : MonoBehaviour
{
    public TMP_Text textCoin;
    private void Update()
    {
        textCoin.text = DataManager.instance.userData.coin.ToString();
    }
}
