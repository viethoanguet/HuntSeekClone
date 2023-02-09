using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LevelMap : MonoBehaviour
{
    public bool checkBosslevel;
    //==false ai
    //==true player
    public List<GameObject> level = new List<GameObject>();
    private GameObject a;
    public GameManager gameManager;
    void Start()
    {
        checkBosslevel = false;
         a = Instantiate(DataManager.instance.assetManager.gameManagers[DataManager.instance.userData.level],gameObject.transform);
        //level.Add(a);
        gameManager = a.GetComponent<GameManager>();

    }
    public void LoadingLevel()
    {
        Destroy(a);
         a = Instantiate(DataManager.instance.assetManager.gameManagers[DataManager.instance.userData.level],gameObject.transform);
        // level.Add(a);
        gameManager = a.GetComponent<GameManager>();
    }
    public void RestartLevel()
    {
        a = Instantiate(DataManager.instance.assetManager.gameManagers[DataManager.instance.userData.level], gameObject.transform);
        // level.Add(a);
        gameManager = a.GetComponent<GameManager>();
    }
    public void checkbo()
    {
        if(gameManager.checkBosslevel)
        {
            checkBosslevel = true;
        }
        else
        {
            checkBosslevel = false;
        }
    }

}
