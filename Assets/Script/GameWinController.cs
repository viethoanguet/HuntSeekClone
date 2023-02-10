using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;
using UnityEngine.UI;
using TMPro;
public class GameWinController : MonoBehaviour
{
    // Start is called before the first frame update
    public TMP_Text textcoin;
    public GameObject coin;
    public GameObject coinEndvalue;
    private void Update()
    {
        textcoin.text = DataManager.instance.userData.coin.ToString();
        Debug.Log(DataManager.instance.userData.coin);
    }
    public void SumCoin()
    {
        coinMove();
        DataManager.instance.userData.coin += 250;
    }    
    public void coinMove()
    {
        coin.transform.DOMove(coinEndvalue.transform.position, 1.5f)
            .OnComplete(()=>activeCoin());
    }    
    public void activeCoin()
    {
        coin.gameObject.SetActive(false);
    }    
}
