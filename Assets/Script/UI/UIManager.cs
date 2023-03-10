using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using UnityEngine.SceneManagement;
public class UIManager : MonoBehaviour
{
    public bool startGame;
    public static UIManager ins;
    public bool checkTime;
    public bool checkBanner;
    public FloatingJoystick joystick;
    [SerializeField] private GameObject time;
    public float timeCountdown;
    [SerializeField] private TMP_Text textTime;
    [SerializeField] private Button hideCanvans;
    [SerializeField] private GameObject gameWin;
    [SerializeField] private GameObject gameLose;
    [SerializeField] private GameObject BannerDelay321;
    public LevelMap LoadingLevelMap;
    private void Awake()
    {
        if (ins == null)
        {
            ins = this;
        }
    }
    private void Start()
    {
        startGame = true;
        Init();
        if (startGame)
        {
            StartCoroutine(StopRotation());
        }
    }
    public void Init()
    {
        gameWin.gameObject.SetActive(false);
        gameLose.gameObject.SetActive(false);
        checkTime = false;
        checkBanner = true;
        hideCanvans.gameObject.SetActive(false);
        time.gameObject.SetActive(false);
        joystick.gameObject.SetActive(false);
        BannerDelay321.gameObject.SetActive(false);
    }
    public void SetChecktime()
    {
        checkTime = true;
    }
    public void ActiveBannerDelay321()
    {
        StartCoroutine(WaitDisplayBanner321());
    }
    IEnumerator WaitDisplayBanner321()
    {
        yield return new WaitForSeconds(1f);
        {
            BannerDelay321.gameObject.SetActive(true);
            BannerDelay321.GetComponent<BannerDelay321>().aaaa();
        }
    }
    IEnumerator StopRotation()
    {
        yield return new WaitForSeconds(4f);
        {
            joystick.gameObject.SetActive(true);
            //checkBanner = true;
            if (!checkTime)
            {
                checkBanner = false;
                time.gameObject.SetActive(true);

            }
            startGame = false;
        }
    }
    private void Update()
    {
        if (!checkTime)
        {
            timeCountdown -= Time.deltaTime;

            if (Mathf.Round(timeCountdown) > 9f)
            {
                textTime.text = "00:" + Mathf.Round(timeCountdown).ToString();
            }
            else
            {
                textTime.text = "00:0" + Mathf.Round(timeCountdown).ToString();
            }
        }

        if (timeCountdown < 0f && !checkTime)
        {
            joystick.check = false;
            timeCountdown = 0f;
            ButtonHide();
            joystick.gameObject.SetActive(false);
            checkTime = true;
        }
        if (!checkBanner)
        {
            if (!joystick.check)
            {
                hideCanvans.gameObject.SetActive(true);
            }
            else
            {
                hideCanvans.gameObject.SetActive(false);
            }
        }
    }

    public void ButtonHide()
    {
        hideCanvans.gameObject.SetActive(false);
        checkTime = true;
        checkBanner = true;
        GameManager.instance.ActiveBossAI();
        time.gameObject.SetActive(false);
        CameraController.instance.setCam1();
        joystick.gameObject.SetActive(false);
    }
    public void GameWin()
    {
        gameWin.gameObject.SetActive(true);
        gameLose.gameObject.SetActive(false);
    }
    public void GameLose()
    {
        gameWin.gameObject.SetActive(false);
        gameLose.gameObject.SetActive(true);
    }
    public void Restart()
    {
        SceneManager.LoadScene(0);
        DataManager.instance.userData.level = 0;
        DataManager.instance.userData.coin = 200;
    }
    public void BackHome()
    {
        SceneManager.LoadScene(1);
    }    
    public void NextLevel()
    {
        if (DataManager.instance.userData.level < 4)
        {
            DataManager.instance.userData.coin += 100;
            startGame = true;
            CameraController.instance.setCam2();
            Init();
            timeCountdown = 15;
            StartCoroutine(StopRotation());
            //AIandPosController.instance.InitPosAI();
            DataManager.instance.UpLevel();
            LoadingLevelMap.LoadingLevel();
        }
        else
        {
            SceneManager.LoadScene(0);
            DataManager.instance.userData.level = 0;
            DataManager.instance.userData.coin = 200;
        }
    }
    private void OnDisable()
    {
        StopAllCoroutines();
    }
}
