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
    public GameObject coinRotate;
    public Button btnSumcoin;
    public spin spinCoin;
    public GameObject listCoin;
    public Animator listDocoin;
    private void Awake()
    {
        spinCoin.gameObject.SetActive(true);
        btnSumcoin.interactable = true;
        listCoin.gameObject.SetActive(false);
    }

    private void Update()
    {
        textcoin.text = DataManager.instance.userData.coin.ToString();
    }
    public void SumCoin()
    {
        btnSumcoin.interactable = false;
        DataManager.instance.userData.coin += spinCoin.valueBonus * 100;
        spinCoin.gameObject.SetActive(false);
        StartCoroutine(WaitneexLevel());
        listCoin.gameObject.SetActive(true);
    }
    IEnumerator WaitneexLevel()
    {
        yield return new WaitForSeconds(0.5f);
        {
            listCoin.gameObject.SetActive(false);
        }

        yield return new WaitForSeconds(2f);
        {
            UIManager.ins.NextLevel();
           
        }
    }
  
}
