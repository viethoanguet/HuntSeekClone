using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ActiveLevel : MonoBehaviour
{
    public List<GameManager> listLevelGame;
    public int current;
    // Start is called before the first frame update
    void Start()
    {
        Init();
    }
    public void Init()
    {
        for(int i=0;i<listLevelGame.Count;i++)
        {
            listLevelGame[i].gameObject.SetActive(false);
        }    
    }
    public void setLevel()
    {
        for(int i=0;i<listLevelGame.Count;i++)
        {
            if(current==DataManager.instance.userData.level+1)
            {

            }    
        }    
    }    
    // Update is called once per frame
    void Update()
    {
        
    }
}
