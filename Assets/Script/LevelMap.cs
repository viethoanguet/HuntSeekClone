using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LevelMap : MonoBehaviour
{

    public List<GameObject> level = new List<GameObject>();
    private GameObject a;
    public GameManager gameManager;
    void Start()
    {
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

}
