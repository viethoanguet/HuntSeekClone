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
    public GameObject coinRotate;
    public Button btnSumcoin;
    public bool check;
    public List<GameObject> listXCoin;
    private void Awake()
    {
        btnSumcoin.interactable = true;
        OnChooseAward();
        check = true;
    }
    public void OnChooseAward()
    {
        if (check)
        {
            coinRotate.transform.DORotate(new Vector3(0, 0, 85), 1,RotateMode.Fast).SetEase(Ease.Linear)
                //.SetLoops(-1, LoopType.Yoyo)
                .OnComplete(()=>LoopsChoose());
        }
    }
    public void LoopsChoose()
    {
        coinRotate.transform.DORotate(new Vector3(0, 0, -85), 1, RotateMode.Fast).SetEase(Ease.Linear)
             .OnComplete(() => OnChooseAward());
    }
    private void Update()
    {
        textcoin.text = DataManager.instance.userData.coin.ToString();
    }
    public void SumCoin()
    {
        check = false;
        btnSumcoin.interactable = false;
        coinMove();
        DataManager.instance.userData.coin += 250;
        for(int i=0;i<listXCoin.Count;i++)
        {
           // if()
        }
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
