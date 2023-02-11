using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AudioManager : MonoBehaviour
{
    public static AudioManager Instance;
    private void Awake()
    {
        if (Instance == null)
        {
            Instance = this;
            DontDestroyOnLoad(gameObject);
        }
    }
    public AudioSource Ondoor;
    public AudioSource gamewin;
    public AudioSource gamelose;
    //public AudioSource coin;
   // public AudioSource Bossmove;
    //public AudioSource BossAttack;
    private void Start()
    {
        
    }

    //public AudioClip clipdoor;
    public void OndoorPlay(AudioClip clip)
    {
        Ondoor.clip = clip;
        Ondoor.Play();
    }
    public void PlaygameWin(AudioClip clip)
    {
        gamewin.clip = clip;
        gamewin.Play();
    }
    public void PlaygameLose(AudioClip clip)
    {
        gamelose.clip = clip;
        gamelose.Play();
    }


}
