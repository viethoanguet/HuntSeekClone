using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
public class LevelMap : MonoBehaviour
{
    public bool checkTimePlay = true;
    public float timePlay = 30f;

    public void LoadingLevel()
    {
        SceneManager.LoadScene(DataManager.instance.userData.level+2) ;
    }
    private void Update()
    {
        if (checkTimePlay)
            timePlay -= Time.deltaTime;
        if (timePlay < 0)
        {
            timePlay = 0;
            CheckTimeOnComplete();
        }
    }
    public void CheckTimeOnComplete()
    {
        checkTimePlay = false;
        GameManager.instance.ActiveBossAILevelMap();
    }

}
