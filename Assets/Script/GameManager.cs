using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;
public class GameManager : MonoBehaviour
{
    public bool checkBosslevel;
    public static GameManager instance;
    public bool startGame;
    [SerializeField] private PlayerController player;
    [SerializeField] private List<AIPlayer> ListAI = new List<AIPlayer>();
    [SerializeField] private ArrowScript arrow;
    [SerializeField] private BossAIController bossAI;
    public CameraController cameraController;
    public float timePlay;
    public float countAI;
    public Door door;
    private void Awake()
    {
        if (instance == null)
        {
            instance = this;
        }
    }
    private void Start()
    {
       
    }
    private void OnEnable()
    {
        Init();
    }
    public void Init()
    {
        checkBosslevel = false;
        countAI = ListAI.Count;
        arrowRotation();
    }
    public void arrowRotation()
    {
        arrow.gameObject.SetActive(true);
    }    
    private void Update()
    {
        if (player.checkBoss)
        {
            checkBosslevel = true;
        }
         else
         {
            checkBosslevel = false;
       }
    }
    public void ActiveBossAI()
    {
        if (!player.checkBoss)
        {
            if(gameObject.activeInHierarchy)
            StartCoroutine(DelayActiveBoss());
        }
    }
    IEnumerator DelayActiveBoss()
    {
        door.rotationDoor();
        yield return new WaitForSeconds(1f);
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
            bossAI.gameObject.SetActive(false);
           // DataManager.instance.AddCoin(20);
            UIManager.ins.GameWin();
        }
    }
    public void OnLose()
    {
        player.isDead = true;
        UIManager.ins.GameLose();
    }
    private void OnDisable()
    {
        StopAllCoroutines();
    }
}
