using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ModelControllerSkin : MonoBehaviour
{

    public GameObject modelDefault;
    public List<PlayerSkin> listSkin;

    private void OnEnable()
    {
        // modelDefault.gameObject.SetActive(true);
    }
    public void SetSkin()
    {
        switch (DataManager.instance.userData.currentCharacterID)
        {
            case 1:
                {
                    Instantiate(listSkin[0], gameObject.transform);
                    modelDefault.gameObject.SetActive(false);
                    break;
                }
            case 2:
                {
                    Instantiate(listSkin[1], gameObject.transform);
                    modelDefault.gameObject.SetActive(false);
                    break;
                }
            case 3:
                {
                    Instantiate(listSkin[2], gameObject.transform);
                    modelDefault.gameObject.SetActive(false);
                    break;
                }
            default:
                return;
        }

    }
}
