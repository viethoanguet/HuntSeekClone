using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Cinemachine;

public class CameraController : MonoBehaviour
{
    public static CameraController instance;
    public CinemachineVirtualCamera cam1;
    public CinemachineVirtualCamera cam2;
    private void Awake()
    {
        instance = this;
    }
    public void SetBossAI(Transform bossAI)
    {
        cam1.LookAt = bossAI;
        cam1.Follow = bossAI;
        cam2.LookAt = bossAI;
    }    
    public void setCam1()
    {
        cam1.gameObject.SetActive(false);
        cam2.gameObject.SetActive(true);
    }    
    public void setCam2()
    {
        cam1.gameObject.SetActive(true);
        cam2.gameObject.SetActive(false);
    }    
}
