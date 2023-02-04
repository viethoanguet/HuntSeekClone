using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using UnityEngine.SceneManagement;
public class UIManager : MonoBehaviour
{
    public static UIManager ins;
    public bool checkTime;
    public bool checkBanner;
    [SerializeField] private FloatingJoystick joystick;
    [SerializeField] private GameObject time;
    public float timeCountdown;
    [SerializeField] private TMP_Text textTime;
    [SerializeField] private Button hideCanvans;
    [SerializeField] private GameManager gameManager;
    [SerializeField] private GameObject gameWin;
    [SerializeField] private GameObject gameLose;
    private void Awake()
    {
        if (ins == null)
        {
            ins = this;
        }

    }
    private void Start()
    {
        gameWin.gameObject.SetActive(false);
        gameLose.gameObject.SetActive(false);
        checkTime = true;
        checkBanner = true;
        hideCanvans.gameObject.SetActive(false);
        time.gameObject.SetActive(false);
        joystick.gameObject.SetActive(false);

        StartCoroutine(StopRotation());
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

        }
    }
    private void Update()
    {
        if (!checkTime)
        {
            timeCountdown -= Time.deltaTime;
            textTime.text = "Time : " + Mathf.Round(timeCountdown).ToString();
        }
           
        if (timeCountdown < 0f && !checkTime)
        {
            checkBanner = true;
            timeCountdown = 0f;
            // ActiveHideCanvas();
            ButtonHide();
        }
        if(!checkBanner)
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
    private void ActiveHideCanvas()
    {
        hideCanvans.gameObject.SetActive(true);
        time.gameObject.SetActive(false);
        // gameManager.ActiveBossAI();
        CameraController.instance.setCam1();
    }
    public void ButtonHide()
    {
        hideCanvans.gameObject.SetActive(false);
        checkTime = true;
        checkBanner = true;
        gameManager.ActiveBossAI();
        time.gameObject.SetActive(false);
        CameraController.instance.setCam1();
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
    }
}
