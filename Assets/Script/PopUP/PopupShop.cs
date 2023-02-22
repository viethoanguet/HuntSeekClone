using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class PopupShop : MonoBehaviour
{
   
    public List<PlayerSkin> listSkin = new List<PlayerSkin>();
    public Button btnskin1;
    public Button btnskin2;
    public Button btnskin3;
    private void Start()
    {
        btnskin1.interactable = true;
        btnskin2.interactable = true;
        btnskin3.interactable = true;
    }
    public void Click()
    {
        GamePopup.instance.OnClickSkin();
    }    
    public void btnClose()
    {
        gameObject.SetActive(false);
    }    
}
