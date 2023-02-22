using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
public class spin : MonoBehaviour
{
    public TMP_Text textBonusCoin;
    public Animator animspin;
    public int valueBonus;

    private void Update()
    {
        textBonusCoin.text = (100 * valueBonus).ToString();
    } 

    public void SetValue(int x)
    {
        valueBonus=x;
    }    

}
