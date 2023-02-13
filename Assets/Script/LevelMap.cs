using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LevelMap : MonoBehaviour
{
    public bool checkTimePlay = true;
    public float timePlay = 30f;
    public bool checkBosslevel;
    //==false ai
    //==true player
    public List<GameObject> level = new List<GameObject>();
    private GameObject a;
    public GameManager gameManager;

    void Start()
    {
        checkBosslevel = false;
        a = Instantiate(DataManager.instance.assetManager.gameManagers[DataManager.instance.userData.level], gameObject.transform);
        //level.Add(a);
        gameManager = a.GetComponent<GameManager>();

    }
    public void LoadingLevel()
    {
        Destroy(a);
        a = Instantiate(DataManager.instance.assetManager.gameManagers[DataManager.instance.userData.level], gameObject.transform);
        // level.Add(a);
        checkTimePlay = true;
        timePlay = 30f;
        gameManager = a.GetComponent<GameManager>();
    }
    public void RestartLevel()
    {
        a = Instantiate(DataManager.instance.assetManager.gameManagers[DataManager.instance.userData.level], gameObject.transform);
        // level.Add(a);
        gameManager = a.GetComponent<GameManager>();
    }
    public void RandomLevel()
    {
        Destroy(a);
        a = Instantiate(DataManager.instance.assetManager.gameManagers[Random.Range(0, 2)], gameObject.transform);
        gameManager = a.GetComponent<GameManager>();
    }
    public void checkbo()
    {
        if (gameManager.checkBosslevel)
        {
            checkBosslevel = true;
        }
        else
        {
            checkBosslevel = false;
        }
    }
    private void Update()
    {
        if (checkTimePlay)
            timePlay -= Time.deltaTime;
        if (timePlay < 0)
        {
            timePlay = 0;
            Debug.Log("checkkkk print");
            CheckTimeOnComplete();
        }
    }
    public void CheckTimeOnComplete()
    {
        checkTimePlay = false;
        
        a.GetComponent<GameManager>().ActiveBossAILevelMap();
    }

}
