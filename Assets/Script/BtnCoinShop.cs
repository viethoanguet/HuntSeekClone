using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
public class BtnCoinShop : MonoBehaviour
{
    public Button btn;
    public int txtCoin;
    // Start is called before the first frame update
    private void Start()
    {
        btn.interactable = true;
    }
    public void OnclickBtn()
    {
        if (DataManager.instance.userData.coin >= txtCoin)
        {
            btn.interactable = false;
            GamePopup.instance.OnClickSkin();
            DataManager.instance.userData.coin -= txtCoin;
            GamePopup.instance.ShowPopupNewSkin();
        }

    }
}
