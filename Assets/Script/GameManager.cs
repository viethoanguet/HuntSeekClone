using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;
public class GameManager : MonoBehaviour
{
    public static GameManager instance;
    public bool startGame;
    [SerializeField] private PlayerController player;
    [SerializeField] private List<AIPlayer> ListAI = new List<AIPlayer>();
    [SerializeField] private ArrowScript arrow;
    [SerializeField] private BossAIController bossAI;

    public float timePlay;
    public float countAI;
    private void Awake()
    {
        if (instance == null)
        {
            instance = this;
        }
    }
    private void Start()
    {
        countAI = ListAI.Count;
    }
    private void Update()
    {
        if(player.checkBoss)
        {
            UIManager.ins.checkTime = true;
           
        }
        else
        {
            UIManager.ins.checkTime = false;
           
        }
    }
    public void ActiveBossAI()
    {
        if (!player.checkBoss)
        {

            StartCoroutine(DelayActiveBoss());
        }    

    }
    IEnumerator DelayActiveBoss()
    {
        yield return new WaitForSeconds(1.5f);
        {
            bossAI.gameObject.SetActive(true);
            yield return new WaitForSeconds(0.1f);
            {
                bossAI.ActiveEffectBoss();
            }

        }
    }
    public void OnWin()
    {
        if (countAI == 0 && !player.isDead)
        {
            Debug.Log(DataManager.instance.userData);
           // DataManager.instance.AddCoin(20);
            UIManager.ins.GameWin();

        }
    }
    public void OnLose()
    {
        player.isDead = true;
        UIManager.ins.GameLose();
    }
 
}